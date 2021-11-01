Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF6744197B
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Nov 2021 11:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbhKAKLn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Nov 2021 06:11:43 -0400
Received: from todd.t-8ch.de ([159.69.126.157]:50805 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232024AbhKAKLk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Nov 2021 06:11:40 -0400
Date:   Mon, 1 Nov 2021 11:09:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1635761345;
        bh=LQZlI/sMH6WQ1R6Ac/PazlDCwM196E6fO967FhmAjMI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t/eL9dlaWPmjiKHRBTXr7otVbaI5yDHZ+YJW44tZdw06c7uRiCAnxEONBSNGKuAZC
         fFpL2yD1zVXexKnZ015vg8mko0lmyS3iuYeoV+Eo2EuV7dICDre2lJPhWhQC/8yG/w
         QJzO9LBLLZvMtef7AxHHhvoGPAASDQIpyRvd/wfg=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 1/6] HID: intel-ish-hid: add support for
 MODULE_DEVICE_TABLE()
Message-ID: <091a4bb3-0734-4b58-9417-7ef18fcc385b@t-8ch.de>
References: <20211029152901.297939-1-linux@weissschuh.net>
 <20211029152901.297939-2-linux@weissschuh.net>
 <cd712bd7-cce7-58fb-d644-ced4fc0c76b1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd712bd7-cce7-58fb-d644-ced4fc0c76b1@redhat.com>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2021-11-01 10:58+0100, Hans de Goede wrote:
> On 10/29/21 17:28, Thomas Weißschuh wrote:
> > This allows to selectively autoload drivers for ISH devices.
> > Currently all ISH drivers are loaded for all systems having any ISH
> > device.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > 
> > ---
> > 
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: linux-input@vger.kernel.org
> > Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > Cc: Jiri Kosina <jkosina@suse.cz>
> > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  include/linux/mod_devicetable.h   | 13 +++++++++++++
> >  scripts/mod/devicetable-offsets.c |  3 +++
> >  scripts/mod/file2alias.c          | 24 ++++++++++++++++++++++++
> >  3 files changed, 40 insertions(+)
> > 
> > diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> > index ae2e75d15b21..befbf53c4b7c 100644
> > --- a/include/linux/mod_devicetable.h
> > +++ b/include/linux/mod_devicetable.h
> > @@ -895,4 +895,17 @@ struct dfl_device_id {
> >  	kernel_ulong_t driver_data;
> >  };
> >  
> > +/* ISHTP (Integrated Sensor Hub Transport Protocol) */
> > +
> > +#define ISHTP_MODULE_PREFIX	"ishtp:"
> > +
> > +/**
> > + * struct ishtp_device_id - ISHTP device identifier
> > + * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
> > + * @context: pointer to driver specific data
> > + */
> > +struct ishtp_device_id {
> > +	guid_t guid;
> 
> The kdoc comment documents a context pointer, but this is missing from the
> actual struct. Having some sort of driver_data (1) field here would be good IMHO.

Fine for me.

I left it out because nothing would be using it at the moment and
it would have been easy to add when needed.

Do you want me to send a v2 for that or would you add it when merging?
(Or remove the spurious comment)

> Regards,
> 
> Hans
> 
> 1) "context" is fine, but AFAIK almost all other foo_device_id structs call this
> driver_data, so that would be more consistent IMHO.

Thomas
