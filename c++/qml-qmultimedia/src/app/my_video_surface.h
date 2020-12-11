#ifndef MY_VIDEO_SURFACE_H
#define MY_VIDEO_SURFACE_H

#include <QObject>
#include <QDebug>
#include <QAbstractVideoSurface>
#include <QVideoSurfaceFormat>

class MyVideoSurface : public QAbstractVideoSurface
{
    private:
        Q_OBJECT

    public:
        explicit MyVideoSurface(QObject *parent = nullptr);
        ~MyVideoSurface() {};

        QList<QVideoFrame::PixelFormat> supportedPixelFormats(
                QAbstractVideoBuffer::HandleType handleType = QAbstractVideoBuffer::NoHandle) const;

        /* Handle the frame and do your processing */
        bool present(const QVideoFrame &frame);

    public slots:

    signals:
        void frameAvailable(QVideoFrame &frame);

    private:

};


#endif // MY_VIDEO_SURFACE_H
