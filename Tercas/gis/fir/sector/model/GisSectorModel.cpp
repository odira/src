#include <QFont>
#include <QBrush>
#include <QColor>

#include "GisSectorModel.h"

GisSectorModel::GisSectorModel(QObject *parent, QSqlDatabase db)
    : QSqlTableModel(parent, db)
{
    setTable(PGSQL_TABLENAME);
    generateRoleNames();
    setEditStrategy(QSqlTableModel::OnManualSubmit);
    select();
}

void GisSectorModel::generateRoleNames()
{
    m_roleNames.clear();
//    for (int i = 0; i < columnCount(); i++) {
//        m_roleNames[Qt::UserRole + 1 + i] =
//            QVariant((this->headerData(i, Qt::Horizontal, Qt::UserRole)).toString().toUtf8()).toByteArray();
//    }
}

QHash<int, QByteArray> GisSectorModel::roleNames() const
{
    return m_roleNames;
}

QVariant GisSectorModel::data(const QModelIndex &idx, int role) const
{
    if (!idx.isValid()) {
        return QVariant();
    }

    int row = idx.row();
    int col = idx.column();

    if (row < 0 || row > rowCount())
        return QVariant();

    if (role < Qt::UserRole)
    {
        switch (col)
        {
        case sector_label:

            if (role == Qt::ForegroundRole)
            {
                QModelIndex colorIdx = createIndex(idx.row(), sector_color);
                QString colorStr = QSqlTableModel::data(colorIdx, Qt::DisplayRole).toString();
                if (!colorStr.isEmpty())
                    return QBrush(QColor(colorStr));
                else
                    return QVariant();
            }
            else if (role == Qt::FontRole)
            {
                QFont font = QFont();
                font.setBold(true);
                return font;
            }

            break;

        case sector_sectorpidarr:

            if (role == Qt::DisplayRole)
            {
                QString sectorPidArrStr = QSqlTableModel::data(idx).toString();
                return sectorPidArrStr;
            }

            break;

        case sector_compound:

            if (role == Qt::DisplayRole)
            {
                return QVariant();
            }
            else if (role == Qt::CheckStateRole)
            {
                return QSqlTableModel::data(idx, Qt::DisplayRole).toBool() ?
                            Qt::Checked :
                            Qt::Unchecked;
            }

            break;

        case sector_freq:

            if (role == Qt::DisplayRole)
            {
                double freq = QSqlTableModel::data(idx).toDouble();
                if (freq != 0.0) {
                    QString freqStr = QString::number(freq) + " MHz";
                    return freqStr;
                }
                else
                    return QVariant();
            }
            else if (role == Qt::FontRole)
            {
                QFont boldFont;
                boldFont.setBold(true);
                return boldFont;
            }
            else if (role == Qt::TextAlignmentRole)
            {
                return Qt::AlignCenter;
            }
            else if (role == Qt::ForegroundRole)
            {
                return QBrush(QColor("green"));
            }

            break;

        case sector_phone:

            if (role == Qt::DisplayRole)
            {
                int phone = QSqlTableModel::data(idx).toInt();
                if (phone != 0) {
                    return phone;
                } else {
                    return QVariant();
                }
            }
            else if (role == Qt::TextAlignmentRole)
            {
                return Qt::AlignCenter;
            }
            else if (role == Qt::ForegroundRole)
            {
                return QBrush(QColor("green"));
            }

            break;

        case sector_npsdz:
        case sector_npspdz:

            if (role == Qt::DisplayRole)
            {
                int nps = QSqlTableModel::data(idx).toInt();
                if (nps != 0) {
                    return nps;
                } else {
                    return QVariant();
                }
            }
            else if (role == Qt::TextAlignmentRole)
            {
                return Qt::AlignCenter;
            }
            else if (role == Qt::ForegroundRole)
            {
                return QBrush(QColor("magenta"));
            }

            break;

        case sector_color:

            if (role == Qt::DisplayRole)
            {
                QString colorStr = QSqlTableModel::data(idx).toString();
                return colorStr;
            }
            else if (role == Qt::ForegroundRole)
            {
                QString colorStr = QSqlTableModel::data(idx).toString();
                return QBrush(QColor(colorStr));
            }

            break;

        case sector_deprecated:
            return true;

            break;

        } //switch (col)
    }
    else if (role >= Qt::UserRole)
    {
        col = role - Qt::UserRole - 1;
//        return QSqlTableModel::data(createIndex(row, col), Qt::DisplayRole);
        return this->data(createIndex(row, col), Qt::DisplayRole);
    }

    return QSqlTableModel::data(idx, role);
}

QVariant GisSectorModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if (orientation == Qt::Horizontal)
    {
        if (section < 0 || section >= columnCount()) {
            return QVariant();
        }

        switch (section) {
        case sector_pid:
            if (role == Qt::DisplayRole)
                return QString(tr("PID"));
            else if (role == Qt::UserRole)
                return "pid";
            break;

        case sector_sectorpidarr:
            if (role == Qt::DisplayRole)
                return QString(tr("Составные\nсектора"));
            else if (role == Qt::UserRole)
                return "sectorpidarr";
            break;

        case sector_label:
            if (role == Qt::DisplayRole)
                return QString(tr("Обозначение"));
            else if (role == Qt::UserRole)
                return "label";
            break;

        case sector_compound:
            if (role == Qt::DisplayRole)
                return QString(tr("Сов\nме\nщен\nный"));
            else if (role == Qt::UserRole)
                return "compound";
            break;

        case sector_freq:
            if (role == Qt::DisplayRole)
                return QString(tr("Частота\nсектора"));
            else if (role == Qt::UserRole)
                return "freq";
            break;

        case sector_border:
            if (role == Qt::DisplayRole)
                return QString(tr("Граница сектора\n(postgis)"));
            else if (role == Qt::UserRole)
                return "border";
            break;

        case sector_geog:
            if (role == Qt::DisplayRole)
                return QString(tr("Граница сектора"));
            else if (role == Qt::UserRole)
                return "geog";
            break;

        case sector_nodepidarr:
            if (role == Qt::DisplayRole)
                return QString(tr("Координаты\nточек границы"));
            else if (role == Qt::UserRole)
                return "nodepidarr";
            break;

        case sector_phone:
            if (role == Qt::DisplayRole)
                return QString(tr("Телефон\nЦУП"));
            else if (role == Qt::UserRole)
                return "phone";
            break;

        case sector_npsdz:
            if (role == Qt::DisplayRole)
                return QString(tr("НПС.\nДопустимое\nзначение"));
            else if (role == Qt::UserRole)
                return "npsdz";
            break;

        case sector_npspdz:
            if (role == Qt::DisplayRole)
                return QString(tr("НПС.\nПредельно-\nдопустимое\nзначение"));
            else if (role == Qt::UserRole)
                return "npspdz";
            break;

        case sector_color:
            if (role == Qt::DisplayRole)
                return QString(tr("Цвет"));
            else if (role == Qt::UserRole)
                return "color";
            break;

        case sector_deprecated:
            return true;
            break;
        }
    }

    return QVariant();
}

bool GisSectorModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid()) {
        return false;
    }

    int col = index.column();

    switch (role)
    {
    case Qt::EditRole:

        if (col == sector_nodepidarr)
        {
            QString nodePidArrStr = value.toString();
            if (nodePidArrStr.isEmpty())
                return QSqlTableModel::setData(index, "{}");
            else
                return QSqlTableModel::setData(index, nodePidArrStr);
        }
        else if (col == sector_sectorpidarr)
        {
            QString sectorPidArrStr = value.toString();
            if (sectorPidArrStr.isEmpty())
                return QSqlTableModel::setData(index, "{}");
            else
                return QSqlTableModel::setData(index, sectorPidArrStr);
        }
        else if (col == sector_label)
        {
            QString sectorLabel = value.toString();
            return QSqlTableModel::setData(index, sectorLabel);
        }
        else if (col == sector_compound)
        {
            return QSqlTableModel::setData(index, false);
        }
        else if (col == sector_phone)
        {
            QString phoneStr = value.toString();
            if (phoneStr.isEmpty()) {
                return QSqlTableModel::setData(index, QVariant());
            } else {
                return QSqlTableModel::setData(index, phoneStr.toInt());
            }
        }
        else if (col == sector_npsdz || col == sector_npspdz)
        {
            QString npsStr = value.toString();
            if (npsStr.isEmpty()) {
                return QSqlTableModel::setData(index, QVariant());
            } else {
                return QSqlTableModel::setData(index, npsStr.toInt());
            }
        }
        else if (col == sector_color)
        {
            QString colorStr = value.toString();
            if (colorStr.isEmpty())
                return QSqlTableModel::setData(index, QVariant());
            else
                return QSqlTableModel::setData(index, colorStr);
        }
        else if (col == sector_freq)
        {
            QString freqStr = value.toString();
            if (freqStr.isEmpty())
                return QSqlTableModel::setData(index, QVariant());
            else
                return QSqlTableModel::setData(index, freqStr.toInt());
        }
        else if (col == sector_deprecated)
        {
            return true;
        }

        break;
    }

    return false;
}

QVariant GisSectorModel::get(int row) const
{
    if (row < 0 || row >= rowCount())
        return QVariant();

    QMap<QString, QVariant> data;
    QHashIterator<int, QByteArray> iterator(roleNames());
    while (iterator.hasNext()) {
        iterator.next();
        data.insert(iterator.value(), QSqlTableModel::data(index(row, iterator.key() - Qt::UserRole - 1)).toString());
    }
    return data;
}
