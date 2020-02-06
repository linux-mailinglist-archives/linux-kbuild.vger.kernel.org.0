Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 384A81543FE
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2020 13:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgBFM0x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Feb 2020 07:26:53 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41458 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbgBFM0w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Feb 2020 07:26:52 -0500
Received: by mail-ed1-f65.google.com with SMTP id c26so5709262eds.8;
        Thu, 06 Feb 2020 04:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TPeReHZ/YnjriyOJ8Sth6S24xjy53mXcSx71JSIWQ7s=;
        b=BGtDmfka/MVNX9OjZh21QaD5yTgdNowi20aPryBLrJLeVhTjYQrVc0TeskJsZXW1Lt
         l2P7gilfRPI1r8/MXsnR4XnoS+3KDb9wu9/9yL1JHX4wRvQT2C59u4fLwnxeuR4q8LnO
         4+wwLPRMGfL4SIrvps3d11pJlH30vGJNHcfsc69AiQMs7P2E4zivq2Z1jjy8U8WKp/I/
         8vzgdfUw52YM5mWu9lH6MQV1U19jEikHtv4ysuwcr+2sue3Fy9AwTBsKM9h7H2wQRB6Y
         1BiAzVY7IT7EuPDTx9qJwKrkAEAYFQpj/yt+WW6iwwG3IZq6sfgMP3qf8dLfoEl3Opjk
         8nOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TPeReHZ/YnjriyOJ8Sth6S24xjy53mXcSx71JSIWQ7s=;
        b=aYnvty6E4GPhVF3s5/YfEB1oT+re8P3VKoDEC8aaKKMSi+LaEHcdKA1azi2pyyxeHM
         WfQpZwlPKa1pfLaz9fHLYICdQ1DFAFw9wKQLhvji0heHlBnS3fIDs5GDDKLk2McTElq5
         oJqc5MFoTzJMyiw1k8UOp7HPLCluMq6bwB5LyhclQ3KtT4JAacj6gk8CvOIIJeyTkHe3
         falvQGQbnNyTvd87zgFe7BpbnczqMf9UUufFyFzmVqEmmwfvUkRqAmqe0E7ccI1m0MA8
         dIqOvuYhNQi/s/AI90cZhN1Tlqo0JXB+KMJKzwdb/ScW7XNtHu5TErITK65mhavjw7vb
         HtQQ==
X-Gm-Message-State: APjAAAVZ4e4D1bZMW9QzO1pvSHvdDlBY6gZtPVByuESjBccV3bqcz197
        RCvhfCZi8h/NUgvhiSdPtmiNwlSiIj1r2CeAUAQ=
X-Google-Smtp-Source: APXvYqzV7bgwJCvtBNZ0J+QRHZFkWN+4h0Dp34I5qe6LC52nzIQnHsbndnwgh+v/1qgXFS6owuu9kYB6RBVMh8j+ivE=
X-Received: by 2002:aa7:d9c6:: with SMTP id v6mr2835147eds.107.1580992010730;
 Thu, 06 Feb 2020 04:26:50 -0800 (PST)
MIME-Version: 1.0
References: <20190918094323.17515-1-e.velu@criteo.com> <20191127150729.860625-1-e.velu@criteo.com>
 <20191127150729.860625-2-e.velu@criteo.com> <20200206132430.6082fa87@endymion>
In-Reply-To: <20200206132430.6082fa87@endymion>
From:   Erwan Velu <erwanaliasr1@gmail.com>
Date:   Thu, 6 Feb 2020 13:25:16 +0100
Message-ID: <CAL2JzuzbU4ZcURzxWMrBK-eysb0pWYWfY_mp4raV5SpAJEJeYg@mail.gmail.com>
Subject: Re: [PATCH 2/2] firmware/dmi: Report DMI Embedded Firmware release
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Erwan Velu <e.velu@criteo.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Mattias Jacobsson <2pi@mok.nu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Changbin Du <changbin.du@intel.com>,
        "Robert P. J. Day" <rpjday@crashcourse.ca>,
        Sumit Garg <sumit.garg@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thanks for the feedback Jean.
I will update the patch accordingly.

Le jeu. 6 f=C3=A9vr. 2020 =C3=A0 13:25, Jean Delvare <jdelvare@suse.de> a =
=C3=A9crit :
>
> On Wed, 27 Nov 2019 16:07:26 +0100, Erwan Velu wrote:
> > Servers that have a BMC encodes the release version of their firmwarein=
 the
>
> encodes -> encode
> firmwarein -> firmware in
>
> >  "Embedded Controller Firmware {Major|Minor} Release" fields of Type 0.
> >
> > This information is used to know which BMC release actually runs.
> > It could be used for some quirks, debugging sessions or inventory tasks=
.
> >
> > A typical output for a Dell system running the 3.75 bios is :
> >
> >     [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/fw_release
> >     3.75
> >     [root@t1700 ~]#
> >
> > Signed-off-by: Erwan Velu <e.velu@criteo.com>
> > ---
> >  drivers/firmware/dmi-id.c       | 3 +++
> >  drivers/firmware/dmi_scan.c     | 1 +
> >  include/linux/mod_devicetable.h | 1 +
> >  scripts/mod/file2alias.c        | 1 +
> >  4 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/firmware/dmi-id.c b/drivers/firmware/dmi-id.c
> > index a2aac65ff771..93eca3222fb0 100644
> > --- a/drivers/firmware/dmi-id.c
> > +++ b/drivers/firmware/dmi-id.c
> > @@ -43,6 +43,7 @@ DEFINE_DMI_ATTR_WITH_SHOW(bios_version,             0=
444, DMI_BIOS_VERSION);
> >  DEFINE_DMI_ATTR_WITH_SHOW(bios_date,         0444, DMI_BIOS_DATE);
> >  DEFINE_DMI_ATTR_WITH_SHOW(sys_vendor,                0444, DMI_SYS_VEN=
DOR);
> >  DEFINE_DMI_ATTR_WITH_SHOW(bios_release,         0444, DMI_BIOS_RELEASE=
);
> > +DEFINE_DMI_ATTR_WITH_SHOW(fw_release,           0444, DMI_EMBEDDED_FW_=
RELEASE);
>
> I suggest naming the define DMI_EC_FIRMWARE_RELEASE. "EC" is the
> commonly accepted abbreviation for "embedded controller". "FW" on the
> other hand is ambiguous as it can stand for firmware but also firewire
> or firewall.
>
> Likewise I think the sysfs attribute should be named
> "ec_firmware_release".
>
> >  DEFINE_DMI_ATTR_WITH_SHOW(product_name,              0444, DMI_PRODUCT=
_NAME);
> >  DEFINE_DMI_ATTR_WITH_SHOW(product_version,   0444, DMI_PRODUCT_VERSION=
);
> >  DEFINE_DMI_ATTR_WITH_SHOW(product_serial,    0400, DMI_PRODUCT_SERIAL)=
;
> > @@ -80,6 +81,7 @@ static ssize_t get_modalias(char *buffer, size_t buff=
er_size)
> >               { "bvr", DMI_BIOS_VERSION },
> >               { "bd",  DMI_BIOS_DATE },
> >               { "br",  DMI_BIOS_RELEASE },
> > +             { "efr", DMI_EMBEDDED_FW_RELEASE },
> >               { "svn", DMI_SYS_VENDOR },
> >               { "pn",  DMI_PRODUCT_NAME },
> >               { "pvr", DMI_PRODUCT_VERSION },
> > @@ -190,6 +192,7 @@ static void __init dmi_id_init_attr_table(void)
> >       ADD_DMI_ATTR(bios_version,      DMI_BIOS_VERSION);
> >       ADD_DMI_ATTR(bios_date,         DMI_BIOS_DATE);
> >       ADD_DMI_ATTR(bios_release,      DMI_BIOS_RELEASE);
> > +     ADD_DMI_ATTR(fw_release,        DMI_EMBEDDED_FW_RELEASE);
> >       ADD_DMI_ATTR(sys_vendor,        DMI_SYS_VENDOR);
> >       ADD_DMI_ATTR(product_name,      DMI_PRODUCT_NAME);
> >       ADD_DMI_ATTR(product_version,   DMI_PRODUCT_VERSION);
> > diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> > index d010c915c1ab..5394aa553140 100644
> > --- a/drivers/firmware/dmi_scan.c
> > +++ b/drivers/firmware/dmi_scan.c
> > @@ -467,6 +467,7 @@ static void __init dmi_decode(const struct dmi_head=
er *dm, void *dummy)
> >               dmi_save_ident(dm, DMI_BIOS_VERSION, 5);
> >               dmi_save_ident(dm, DMI_BIOS_DATE, 8);
> >               dmi_save_release(dm, DMI_BIOS_RELEASE, 21);
> > +             dmi_save_release(dm, DMI_EMBEDDED_FW_RELEASE, 23);
> >               break;
> >       case 1:         /* System Information */
> >               dmi_save_ident(dm, DMI_SYS_VENDOR, 4);
> > diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_device=
table.h
> > index 618933d770e6..ad64a101676d 100644
> > --- a/include/linux/mod_devicetable.h
> > +++ b/include/linux/mod_devicetable.h
> > @@ -533,6 +533,7 @@ enum dmi_field {
> >       DMI_BIOS_VERSION,
> >       DMI_BIOS_DATE,
> >       DMI_BIOS_RELEASE,
> > +     DMI_EMBEDDED_FW_RELEASE,
> >       DMI_SYS_VENDOR,
> >       DMI_PRODUCT_NAME,
> >       DMI_PRODUCT_VERSION,
> > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> > index cc48930cc02a..c0e1d379d9df 100644
> > --- a/scripts/mod/file2alias.c
> > +++ b/scripts/mod/file2alias.c
> > @@ -937,6 +937,7 @@ static const struct dmifield {
> >       { "bvr", DMI_BIOS_VERSION },
> >       { "bd",  DMI_BIOS_DATE },
> >       { "br",  DMI_BIOS_RELEASE },
> > +     { "efr", DMI_EMBEDDED_FW_RELEASE },
> >       { "svn", DMI_SYS_VENDOR },
> >       { "pn",  DMI_PRODUCT_NAME },
> >       { "pvr", DMI_PRODUCT_VERSION },
>
> Also, as already mentioned during my first review, please merge both
> patches together. They touch exactly the same areas, they are doing
> basically the same thing, and will never be backported individually, so
> splitting them creates more paperwork with no benefit.
>
> --
> Jean Delvare
> SUSE L3 Support
