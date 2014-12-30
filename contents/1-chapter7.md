# 7 Having Fun with Multimedia #

> Multimedia capabilities are one of the strong points of GNOME. It provides numerous APIs for developers to easily present multimedia content. This opens quite a broad spectrum of application ideas that can be implemented; for example, a simple audio/video conversion tool, a music or video stream player, CCTV monitoring, or a full-blown education application, to name a few.

In this chapter, we will take a look at the basic usage of GStreamer by presenting audio and video content with the GStreamer API. Specifically, we will discuss the following:

- The GStreamer concept
- Playing audio and video
- Applying filters to stream

Let's get into more detail now.

## Packages required

This chapter uses software, namely the MPEG codecs, which are not freely available in the
default Linux distribution repositories. Fedora users need to add a third-party repository in
order to be able to use the software. Type the following command on the terminal to add
this third-party library:

````
su -c 'yum localinstall --nogpgcheck http://download1.rpmfusion.org/
free/fedora/rpmfusion-free-release-stable.noarch.rpm http://download1.
rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm'Having Fun with Multimedia
````

The following packages need to be installed:
- **Fedora**: gstreamer-plugins-bad , gstreamer-plugins-ugly , gstreamer-ffmpeg , and gstreamer-tools
- **Ubuntu/Debian**: gstreamer0.10-plugins-bad , gstreamer0.10-plugins-ugly , gstreamer0.10-plugins-ffmpeg , gstreamer0.10-tools , and libgstreamer-plugins-base0.10-dev

## Understanding the basic concept of GStreamer

**GStreamer** is a media-processing framework used by GNOME to support its multimedia
feature. It has a plugin infrastructure which provides an abstraction layer for opening,
encoding, decoding, and filtering media streams. It means that as long as there is a plugin for
a certain multimedia format, we can open or write files or play media with that format. The
following diagram shows the simplified architecture of the GStreamer API:

[IMG]

As we can see from the diagram, the application can just use the APIs provided by GStreamer
and the implementation of a particular codec or filter can also use the API. The application
does not need to know the details of a codec or a filter and vice versa. Unfortunately, in the
real world, there are still audio and video player applications which implement everything
shown in the diagram by themselves and they differ between each other.

GStreamer has the concept of **elements**. It is the basic part of the entities involved in a
media stream. There is an element where the stream originates, there is another element
where the stream ends, and also additional elements in between where the stream is
manipulated while being passed through it.

We can imagine the data as water. Water flows into a system where the elements are
connected with pipes. They are put into the system by an element such as a water gallon,
a glass, a respiratory system, or even a reactor, which hypothetically produces water from
oxygen and hydrogen molecules.

Inside the system, the water can be manipulated so that the color or smell can be changed
by the filter elements. We can even combine these filters.

After that, the water exits the system through an element such as a bucket, a glass, a spray,
or even a vaporizer.

Each element at least has a door, which is source, sink, or both. **Source** is where the data
flows from and **sink** is where the data flows into. These doors are called **pads**. An element
could have more than one pad, for example, for elements which can produce both audio
and video streams. These pads can be both statically or dynamically created.

We can see the visualization of the elements as shown in the following diagram:
[IMG]

Each element has it own states, which is either of the following:

- **Null**: The default state of an element
- **Ready**: The state where the stream is ready and waiting to be flown
- **Paused**: The state where the stream is open but the flow is frozen
- **Playing**: The state where the stream is open and is flowing

The data is passed into the system by using buffers as the pipes pass the water into
the system. The whole system is orchestrated by employing events which carry control
information. The events are sent to the elements so they can react according to the
events delivered.

The events—or in GStreamer terms, messages—are delivered through a bus. The bus is
created by the pipeline. And by tapping into the bus, we can subscribe to the messages
posted there.
