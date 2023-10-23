#include "SfrTableWidgetDemo.h"
#include <Widgets/SfrTableWidget.h>
#include "ui_SfrTableWidgetDemo.h"
#include <QLayout>

SfrTableWidgetDemo::SfrTableWidgetDemo(QWidget *parent)
    : QMainWindow(parent), ui(new Ui::SfrTableWidgetDemoClass)
{
    ui->setupUi(this);
    QVBoxLayout* mainLayout = new QVBoxLayout;
    m_output_widget = new SfrTableWidget;
    m_pose_widget = new SfrTableWidget;
    mainLayout->addWidget(m_output_widget);
    mainLayout->addWidget(m_pose_widget);

    QWidget* CenterWgt = new QWidget(this);
    CenterWgt->setLayout(mainLayout);
    this->setCentralWidget(CenterWgt);

    sfr::math::Pose3D<float> pose;
    pose.set(1, 2, 3, 1, 2, 3, 4);

    sfr::geometry::Box3D<float> box;
    box.pose = pose;
    box.size.x = 1;
     box.size.y = 2;
     box.size.z = 3;

    //��ʾ����
    QStringList strs = { u8"X", u8"Y", u8"Z", u8"W", u8"P", u8"R", u8"length", u8"width" };
    m_output_widget->setRowCount(1);
    m_output_widget->setColumnCount(strs.size());
    m_output_widget->setHorizontalHeaderLabels(strs);
    m_output_widget->showBox(0,0,box, OrientationMethod::WPR);
    
    //��ʾλ��
    QStringList strs2 = { u8"X", u8"Y", u8"Z", u8"W", u8"P", u8"R"};
    m_pose_widget->setEditTriggers(QAbstractItemView::EditTrigger::DoubleClicked | QAbstractItemView::EditTrigger::EditKeyPressed);
    m_pose_widget->setRowCount(20);
    m_pose_widget->setColumnCount(strs2.size());
    m_pose_widget->setHorizontalHeaderLabels(strs2);
    m_pose_widget->showPose(0, 0, box.pose, OrientationMethod::WPR);
    m_pose_widget->showPose(1, 0, box.pose, OrientationMethod::WPR);

    m_pose_widget->clear();
    m_pose_widget->showPose(1, 0, box.pose, OrientationMethod::WPR);
}

SfrTableWidgetDemo::~SfrTableWidgetDemo()
{}
