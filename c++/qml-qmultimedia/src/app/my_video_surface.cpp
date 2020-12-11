#include <iostream>

#include "my_video_surface.h"

using namespace std;

MyVideoSurface::MyVideoSurface(QObject *parent):
        QAbstractVideoSurface(parent)
{
    qDebug() << "Frame Source init";
}

QList<QVideoFrame::PixelFormat> MyVideoSurface::supportedPixelFormats(
                QAbstractVideoBuffer::HandleType handleType) const
{
    Q_UNUSED(handleType);

    QList<QVideoFrame::PixelFormat> listPixelFormats;

	listPixelFormats << QVideoFrame::Format_YUYV
        << QVideoFrame::Format_YUV444
        << QVideoFrame::Format_YUV420P
		<< QVideoFrame::Format_YV12
		<< QVideoFrame::Format_UYVY
		<< QVideoFrame::Format_YUYV
		<< QVideoFrame::Format_NV12
		<< QVideoFrame::Format_NV21
		<< QVideoFrame::Format_Jpeg
		<< QVideoFrame::Format_ARGB32
		<< QVideoFrame::Format_RGB32
		<< QVideoFrame::Format_RGB24
		<< QVideoFrame::Format_RGB565
		<< QVideoFrame::Format_RGB555
		<< QVideoFrame::Format_BGRA32
		<< QVideoFrame::Format_BGR32
		<< QVideoFrame::Format_BGR24
		<< QVideoFrame::Format_BGR565
		<< QVideoFrame::Format_BGR555
		<< QVideoFrame::Format_CameraRaw;

	qDebug() << "Supported Pixel Formats: " << listPixelFormats;

	// Return the formats you will support
	return listPixelFormats;
}

bool MyVideoSurface::present(const QVideoFrame &frame)
{

    Q_UNUSED(frame);

    // Handle the frame and do your processing
    if (frame.isValid()) {
		QVideoFrame cloneFrame(frame);
        qDebug() << "source: "<< frame.pixelFormat() << frame.handleType();
		emit frameAvailable(cloneFrame);
        cloneFrame.unmap();

		return true;
	}

	return false;
}
