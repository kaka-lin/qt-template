#ifndef MY_MEDIA_PLAYER_H
#define MY_MEDIA_PLAYER_H

#include <QObject>
#include <QDebug>
#include <QAbstractVideoSurface>
#include <QVideoSurfaceFormat>
#include <QMediaPlayer>

class MyMediaPlayer : public QObject
{
    private:
        Q_OBJECT
        Q_PROPERTY(QAbstractVideoSurface *videoSurface READ videoSurface WRITE setVideoSurface)

    public:
        explicit MyMediaPlayer(QObject *parent = nullptr);
        ~MyMediaPlayer() {};

        QAbstractVideoSurface *videoSurface() const;
        void setVideoSurface(QAbstractVideoSurface *surface);
        void setFormat(int width, int height, int format);
        void getMetaData();

        Q_INVOKABLE void play();
        Q_INVOKABLE void pause();
        Q_INVOKABLE void stop();

    public slots:
        void onNewVideoContentReceived(const QVideoFrame &frame);
        void onMediaStatusChanged(QMediaPlayer::MediaStatus status);

    signals:
        void frameFinished();

    private:
        QAbstractVideoSurface *m_surface;
        QVideoSurfaceFormat m_format;
        QMediaPlayer *m_player;
};


#endif // MY_MEDIA_PLAYER_H
