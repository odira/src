#include <QtWidgets>

#include <QDialogButtonBox>
#include "maindialogcontrolbuttonbox.h"


VyborgMainDialogControlButtonBox::VyborgMainDialogControlButtonBox(QWidget *parent)
    : QDialogButtonBox(parent)
{
    QPushButton *sortButton   = new QPushButton(tr("Sort"));
    QPushButton *filterButton = new QPushButton(tr("Filter"));
    QPushButton *updateButton = new QPushButton(tr("Update"));
    QPushButton *addButton    = new QPushButton(tr("Add"));
    QPushButton *removeButton = new QPushButton(tr("Remove"));
    QPushButton *aboutButton  = new QPushButton(tr("About"));
    QPushButton *closeButton  = new QPushButton(tr("Close"));

    this->addButton(filterButton, QDialogButtonBox::ActionRole);
    this->addButton(sortButton,   QDialogButtonBox::ActionRole);
    this->addButton(updateButton, QDialogButtonBox::ActionRole);
    this->addButton(addButton,    QDialogButtonBox::ActionRole);
    this->addButton(removeButton, QDialogButtonBox::ActionRole);
    this->addButton(aboutButton,  QDialogButtonBox::ActionRole);
    this->addButton(closeButton,  QDialogButtonBox::ActionRole);


    connect(sortButton, SIGNAL(clicked()),
            SLOT(on_sortButtonClicked()));
    connect(filterButton, SIGNAL(clicked()),
            SLOT(on_filterButtonClicked()));
    connect(updateButton, SIGNAL(clicked()),
            SLOT(on_updateButtonClicked()));
    connect(addButton, SIGNAL(clicked()),
            SLOT(on_addButtonClicked()));
    connect(removeButton, SIGNAL(clicked()),
            SLOT(on_removeButtonClicked()));
    connect(aboutButton, SIGNAL(clicked()),
            SLOT(on_aboutButtonClicked()));
    connect(closeButton, SIGNAL(clicked()),
            SLOT(on_closeButtonClicked()));
}

void VyborgMainDialogControlButtonBox::on_sortButtonClicked()
{
    emit sort();
}

void VyborgMainDialogControlButtonBox::on_filterButtonClicked()
{
    emit filter();
}

void VyborgMainDialogControlButtonBox::on_updateButtonClicked()
{
    emit update();
}

void VyborgMainDialogControlButtonBox::on_addButtonClicked()
{
    emit add();
}

void VyborgMainDialogControlButtonBox::on_removeButtonClicked()
{
    emit remove();
}

void VyborgMainDialogControlButtonBox::on_aboutButtonClicked()
{
    emit about();
}

void VyborgMainDialogControlButtonBox::on_closeButtonClicked()
{
    emit close();
}

//void VyborgMainDialogControlButtonBox::addButton(QPushButton *button)
//{
//    this->addButton();
//}
