package xandroid.view.accessibility;

import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.accessibility.AccessibilityNodeInfo;

public class AccessibilityAction {

    private final int actionId;
    private final CharSequence label;

    private AccessibilityAction(int standardActionId) {
        this(standardActionId, null);
    }

    public AccessibilityAction(int actionId, CharSequence label) {
        this.actionId = actionId;
        this.label = label;
    }


    @androidx.annotation.RequiresApi(api = Build.VERSION_CODES.KITKAT)
    public void removeAction(AccessibilityNodeInfo accessibilityNodeInfo) {
        accessibilityNodeInfo.removeAction(actionId);
    }

    public void addAction(AccessibilityNodeInfo accessibilityNodeInfo) {
        accessibilityNodeInfo.addAction(actionId);
    }


    public int getId() {
        return actionId;
    }

    public CharSequence getLabel() {
        return label;
    }



    @Override
    public boolean equals(Object other) {
        if (other instanceof AccessibilityAction) {
            AccessibilityAction instance = (AccessibilityAction) other;
            return instance.actionId == actionId && instance.label.equals(label);
        }
        return false;
    }

    @Override
    public int hashCode() {
        return actionId;
    }

    @Override
    public String toString() {
        return actionId + " " + label;
    }

    public static final AccessibilityAction ACTION_FOCUS = new AccessibilityAction(AccessibilityNodeInfo.ACTION_FOCUS);
    public static final AccessibilityAction ACTION_CLEAR_FOCUS = new AccessibilityAction(AccessibilityNodeInfo.ACTION_CLEAR_FOCUS);
    public static final AccessibilityAction ACTION_SELECT = new AccessibilityAction(AccessibilityNodeInfo.ACTION_SELECT);
    public static final AccessibilityAction ACTION_CLEAR_SELECTION = new AccessibilityAction(AccessibilityNodeInfo.ACTION_CLEAR_SELECTION);
    public static final AccessibilityAction ACTION_CLICK = new AccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK);
    public static final AccessibilityAction ACTION_LONG_CLICK = new AccessibilityAction(AccessibilityNodeInfo.ACTION_LONG_CLICK);
    public static final AccessibilityAction ACTION_ACCESSIBILITY_FOCUS = new AccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS);
    public static final AccessibilityAction ACTION_CLEAR_ACCESSIBILITY_FOCUS = new AccessibilityAction(AccessibilityNodeInfo.ACTION_CLEAR_ACCESSIBILITY_FOCUS);
    public static final AccessibilityAction ACTION_NEXT_AT_MOVEMENT_GRANULARITY = new AccessibilityAction(AccessibilityNodeInfo.ACTION_NEXT_AT_MOVEMENT_GRANULARITY);
    public static final AccessibilityAction ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY = new AccessibilityAction(AccessibilityNodeInfo.ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY);
    public static final AccessibilityAction ACTION_NEXT_HTML_ELEMENT = new AccessibilityAction(AccessibilityNodeInfo.ACTION_NEXT_HTML_ELEMENT);
    public static final AccessibilityAction ACTION_PREVIOUS_HTML_ELEMENT = new AccessibilityAction(AccessibilityNodeInfo.ACTION_PREVIOUS_HTML_ELEMENT);
    public static final AccessibilityAction ACTION_SCROLL_FORWARD = new AccessibilityAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD);
    public static final AccessibilityAction ACTION_SCROLL_BACKWARD = new AccessibilityAction(AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD);
    public static final AccessibilityAction ACTION_COPY = new AccessibilityAction(AccessibilityNodeInfo.ACTION_COPY);
    public static final AccessibilityAction ACTION_PASTE = new AccessibilityAction(AccessibilityNodeInfo.ACTION_PASTE);
    public static final AccessibilityAction ACTION_CUT = new AccessibilityAction(AccessibilityNodeInfo.ACTION_CUT);
    public static final AccessibilityAction ACTION_SET_SELECTION = new AccessibilityAction(AccessibilityNodeInfo.ACTION_SET_SELECTION);
    public static final AccessibilityAction ACTION_EXPAND = new AccessibilityAction(AccessibilityNodeInfo.ACTION_EXPAND);
    public static final AccessibilityAction ACTION_COLLAPSE = new AccessibilityAction(AccessibilityNodeInfo.ACTION_COLLAPSE);
    public static final AccessibilityAction ACTION_DISMISS = new AccessibilityAction(AccessibilityNodeInfo.ACTION_DISMISS);
    public static final AccessibilityAction ACTION_SET_TEXT = new AccessibilityAction(2097152);//AccessibilityNodeInfo.ACTION_SET_TEXT
    public static final AccessibilityAction ACTION_PRESS_AND_HOLD = new AccessibilityAction(android.R.id.accessibilityActionPressAndHold);
    public static final AccessibilityAction ACTION_IME_ENTER = new AccessibilityAction(android.R.id.accessibilityActionImeEnter);


    public static final Parcelable.Creator<AccessibilityAction> CREATOR = new Parcelable.Creator<AccessibilityAction>() {
        public AccessibilityAction createFromParcel(Parcel in) {
            return new AccessibilityAction(in);
        }

        public AccessibilityAction[] newArray(int size) {
            return new AccessibilityAction[size];
        }
    };

    private AccessibilityAction(Parcel in) {
        actionId = in.readInt();
        if (in.readInt() == 0) {
            label = in.readParcelable(getClass().getClassLoader());
        } else {
            label = in.readString();
        }
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        out.writeInt(actionId);
        if (label instanceof Parcelable) {
            out.writeInt(0);
            out.writeParcelable((Parcelable) label, flags);
        } else {
            out.writeInt(1);
            out.writeString((String) label);
        }
    }
}
