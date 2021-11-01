Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73675441998
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Nov 2021 11:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhKAKPf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Nov 2021 06:15:35 -0400
Received: from todd.t-8ch.de ([159.69.126.157]:41125 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231911AbhKAKPV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Nov 2021 06:15:21 -0400
Date:   Mon, 1 Nov 2021 11:12:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1635761566;
        bh=BacEOloGu941ifshgFV017fSfdgTqtScRycZ+trcKLw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KbU+mPV1kDhiWPxJn9jrujov28UUqF7Sq+prYhjaesfXOqDTaomgoWpgcHnB1BDxu
         3+sIzwvZtrf/yeTLBllYomRVG55zEUahF4sT1xmo5nKIlG9oV1LXLZjQjojDH7Xncp
         /oQempaeqYroSvi5/Jgp/FSAcKW46cLp1paKr2uM=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        platform-driver-x86@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/6] MODULE_DEVICE_TABLE() support for the ISHTP bus
Message-ID: <1bb82b37-06e4-4937-ba0d-57fd301eaf2e@t-8ch.de>
References: <20211029152901.297939-1-linux@weissschuh.net>
 <883db585-c9bb-5255-4ddd-f093616af1a1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <883db585-c9bb-5255-4ddd-f093616af1a1@redhat.com>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2021-11-01 10:56+0100, Hans de Goede wrote:
> On 10/29/21 17:28, Thomas Weißschuh wrote:
> > Currently as soon as any ISHTP device appears all available ISHTP device
> > drivers are loaded automatically.
> > This series extends the MODULE_DEVICE_TABLE() functionality to properly handle
> > the ishtp bus and switches the drivers over to use it.
> > 
> > Patch 1 adds the infrastructure to handle ishtp devices via MODULE_DEVICE_TABLE()
> > Patch 2 replaces some inlined constants with ones now defined by mod_devicetable.h
> > Patches 3-6 migrate all ishtp drivers to MODULE_DEVICE_TABLE()
> > 
> > Note: This patchset is based on the pdx86/for-next tree because that contains
> > one of the drivers that is not yet in the other trees.
> 
> Since most of the changes here are under drivers/hid and since the latter
> patches depend on 1/6, I believe it would be best to merge the entire series
> through the HID tree, here is my ack for this:
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>

Please note that patch 6 modifies a driver that is not yet available in the HID
and 5.15 trees but only in pdx86/for-next.

Thomas
