Return-Path: <linux-kbuild+bounces-196-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFEB7FDF60
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 19:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 529D42825AE
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 18:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001713B2A5;
	Wed, 29 Nov 2023 18:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02201139
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 10:35:23 -0800 (PST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1r8POr-0006HJ-Mr; Wed, 29 Nov 2023 19:35:05 +0100
Message-ID: <03595817-4698-46d3-b2d8-3bc40c7e723e@pengutronix.de>
Date: Wed, 29 Nov 2023 19:35:00 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] arm64: boot: Support Flat Image Tree
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>,
 lkml <linux-kernel@vger.kernel.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Will Deacon <will@kernel.org>,
 linux-kbuild@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20231129172200.430674-1-sjg@chromium.org>
 <20231129172200.430674-3-sjg@chromium.org>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20231129172200.430674-3-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

Hello Simon,

On 29.11.23 18:21, Simon Glass wrote:
> Add a script which produces a Flat Image Tree (FIT), a single file
> containing the built kernel and associated devicetree files.
> Compression defaults to gzip which gives a good balance of size and
> performance.

Thanks for working on this. I think it's useful to have the kernel
generate a FIT image out of the box. More complex use cases are always
free to call mkimage with a custom ITS.

 
> The files compress from about 86MB to 24MB using this approach.
> 
> The FIT can be used by bootloaders which support it, such as U-Boot
> and Linuxboot. It permits automatic selection of the correct
> devicetree, matching the compatible string of the running board with
> the closest compatible string in the FIT. There is no need for
> filenames or other workarounds.
> 
> Add a 'make image.fit' build target for arm64, as well.

not that it matters much, but should this maybe called Image.fit
as the other Image types are capitalized too?

>  EFI_ZBOOT_PAYLOAD	:= Image
>  EFI_ZBOOT_BFD_TARGET	:= elf64-littleaarch64
>  EFI_ZBOOT_MACH_TYPE	:= ARM64
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1a965fe68e01..e1c06ca3c847 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -496,6 +496,19 @@ quiet_cmd_uimage = UIMAGE  $@
>  			-a $(UIMAGE_LOADADDR) -e $(UIMAGE_ENTRYADDR) \
>  			-n '$(UIMAGE_NAME)' -d $< $@

Doesn't hardcoding a load address and entry address here defeat the point
of having FIT as generic portable image format?

At least barebox will try to place the kernel image at physical address 0 and
will exit with an error message if no SDRAM is located at that address.
The recommendation in that case is to omit load and entry address altogether
to have barebox find a suitable location, but I see now that the FIT specification
requires a load and entry address. What would happen if U-Boot tries to load this
FIT image on a board that has no DRAM at address 0?

Please Cc me on subsequent revisions. I am interested in testing that this works for barebox
too.

Thanks,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


