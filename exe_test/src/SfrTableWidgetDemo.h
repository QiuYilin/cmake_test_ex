#pragma once

#include <QtWidgets/QMainWindow>
namespace Ui {
    class SfrTableWidgetDemoClass;
}

class SfrTableWidget;
class SfrTableWidgetDemo : public QMainWindow
{
    Q_OBJECT

public:
    SfrTableWidgetDemo(QWidget *parent = nullptr);
    ~SfrTableWidgetDemo();

    SfrTableWidget* m_output_widget;
    SfrTableWidget* m_pose_widget;

private:
    Ui::SfrTableWidgetDemoClass *ui;
};
