Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20CF9DEF9C
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2019 16:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfJUOb4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Mon, 21 Oct 2019 10:31:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:57680 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727140AbfJUOb4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Oct 2019 10:31:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2197DC138;
        Mon, 21 Oct 2019 14:31:53 +0000 (UTC)
Date:   Mon, 21 Oct 2019 16:32:08 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Erwan Velu" <erwanaliasr1@gmail.com>
Cc:     "Robert P. J. Day" <rpjday@crashcourse.ca>,
        "Erwan Velu" <e.velu@criteo.com>,
        "Changbin Du" <changbin.du@intel.com>,
        "Boris Brezillon" <bbrezillon@kernel.org>,
        "Mauro Carvalho Chehab" <mchehab+samsung@kernel.org>,
        "Jens Wiklander" <jens.wiklander@linaro.org>,
        "Sumit Garg" <sumit.garg@linaro.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Michal Marek" <michal.lkml@markovi.net>,
        "Mattias Jacobsson" <2pi@mok.nu>,
        "Masahiro Yamada" <yamada.masahiro@socionext.com>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] firmware/dmi_scan: Add dmi_save_release to save
 releases fields
Message-ID: <20191021163208.5cd03d59@endymion>
In-Reply-To: <20190918094323.17515-1-e.velu@criteo.com>
References: <20190918094323.17515-1-e.velu@criteo.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Erwan,

Sorry for the late answer.

On Wed, 18 Sep 2019 11:43:19 +0200, Erwan Velu wrote:
> In DMI type 0, there is several fields that encodes a release.

is -> are
encodes -> encode

> The dmi_save_release() function have the logic to check if the field is valid.
> If so, it reports the actual value.
> 
> Signed-off-by: Erwan Velu <e.velu@criteo.com>
> ---
>  drivers/firmware/dmi_scan.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

This patch introduces a warning:

drivers/firmware/dmi_scan.c:185:20: warning: ‘dmi_save_release’ defined but not used [-Wunused-function]
 static void __init dmi_save_release(const struct dmi_header *dm, int slot,
                    ^~~~~~~~~~~~~~~~

because you add a static function with no user. I understand that you
add a use later in the series, but it's not OK to introduce a warning
even if temporary. It also makes little sense to split the changes that
way as there is no way to cherry-pick one of the patches without the
rest. And it makes things more difficult to review too, as I can't
possibly judge if this function if right without also seeing where is
will be called and how.

So, please merge all the changes into a single patch.

> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index 35ed56b9c34f..202bd2c69d0f 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -181,6 +181,32 @@ static void __init dmi_save_ident(const struct dmi_header *dm, int slot,
>  	dmi_ident[slot] = p;
>  }
>  
> +static void __init dmi_save_release(const struct dmi_header *dm, int slot,
> +		int index)
> +{
> +	const u8 *d;
> +	char *s;
> +
> +	// If the table doesn't have the field, let's return

Please stick to C89-style comments (/* */) as used everywhere else in
this file.

> +	if (dmi_ident[slot] || dm->length < index)
> +		return;
> +
> +	d = (u8 *) dm + index;
> +
> +	// As per the specification,
> +	// if the system doesn't have the field, the value is FF
> +	if (d[0] == 0xFF)
> +		return;

That's not exactly what the specification says. It says:

"If the system does not support the use of [the System BIOS Major
Release] field, the value is 0FFh for both this field and the System
BIOS Minor Release field." So unused is when both fields are 0xFF. You
can't test them independently.

Same goes for the Embedded Controller Firmware Release fields, even if
it is worded differently, the logic is the same.

> +
> +	s = dmi_alloc(4);
> +	if (!s)
> +		return;
> +
> +	sprintf(s, "%u", d[0]);
> +
> +	dmi_ident[slot] = s;
> +}
> +
>  static void __init dmi_save_uuid(const struct dmi_header *dm, int slot,
>  		int index)
>  {


-- 
Jean Delvare
SUSE L3 Support
