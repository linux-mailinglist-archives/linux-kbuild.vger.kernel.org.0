Return-Path: <linux-kbuild+bounces-7887-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25645AF9CCF
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Jul 2025 01:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BE141C26504
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 23:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9321721ADB5;
	Fri,  4 Jul 2025 23:49:39 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A12954723;
	Fri,  4 Jul 2025 23:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751672979; cv=none; b=UjAFzUrU/7v9IiOIYTXYkjlzkjg2A1sUytre4TP08xt2bTYe/magCis4ijD5111NEBh+A5yrHrFYod4LVzmBRx7Mw7J/0eRoEt9RBwuqA+z3biQJjn+S/t9hPCnBiA7hDVGb51bB7Yh/0Gwsf9AjDzvF+kSnxdlbZgxRm1Gqm0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751672979; c=relaxed/simple;
	bh=KsnRsT5Zp6SxXom0RgloRgybMVnMUbjcLP3imWbabD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J43XlxS97ku0WPWrNUI5KK5Y3PuTM1JUozzA+Ts9PN7PdmEKcNEfJ4225L5J2uoQY7KANw4rECQpPWKCD+L59rKviVezDvi2x4jdx36NK7OKScqd/HFec9+FrawmwTZ/F/ZEijVDUKnkrE1s1RgKuHGd6Qeug/HCzk+GlO8ECVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 28B8372C8CC;
	Sat,  5 Jul 2025 02:49:29 +0300 (MSK)
Received: from pony.office.basealt.ru (unknown [193.43.10.9])
	by imap.altlinux.org (Postfix) with ESMTPSA id 15D0E36D0184;
	Sat,  5 Jul 2025 02:49:29 +0300 (MSK)
Received: by pony.office.basealt.ru (Postfix, from userid 500)
	id EBF48360D4F8; Sat,  5 Jul 2025 02:49:28 +0300 (MSK)
Date: Sat, 5 Jul 2025 02:49:28 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Andreas Schwab <schwab@linux-m68k.org>, 
	Masahiro Yamada <masahiroy@kernel.org>
Cc: stable@vger.kernel.org, Michal Marek <mmarek@suse.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yong Zhi <yong.zhi@intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, Mark Brown <broonie@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] mod_devicetable: Enlarge the maximum platform_device_id
 name length
Message-ID: <aukyxucdlmthz3v5a6xoh42vmz@altlinux.org>
References: <20250415231420.work.066-kees@kernel.org>
 <Z_9SIBPsf4_cQ77Y@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_9SIBPsf4_cQ77Y@smile.fi.intel.com>

Andy, Kees,

On Wed, Apr 16, 2025 at 09:45:52AM +0300, Andy Shevchenko wrote:
> On Tue, Apr 15, 2025 at 04:14:24PM -0700, Kees Cook wrote:
> > The 20 byte length of struct platform_device_id::name is not long enough
> > for many devices (especially regulators), where the string initialization
> > is getting truncated and missing the trailing NUL byte. This is seen
> > with GCC 15's -Wunterminated-string-initialization option:
> > 
> > drivers/regulator/hi6421v530-regulator.c:189:19: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (21 chars into 20 available) [-Wunterminated-string-initialization]
> >   189 |         { .name = "hi6421v530-regulator" },
> >       |                   ^~~~~~~~~~~~~~~~~~~~~~
> > drivers/regulator/hi6421v600-regulator.c:278:19: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (21 chars into 20 available) [-Wunterminated-string-initialization]
> >   278 |         { .name = "hi6421v600-regulator" },
> >       |                   ^~~~~~~~~~~~~~~~~~~~~~
> > drivers/regulator/lp87565-regulator.c:233:11: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (21 chars into 20 available) [-Wunterminated-string-initialization]
> >   233 |         { "lp87565-q1-regulator", },
> >       |           ^~~~~~~~~~~~~~~~~~~~~~
> > sound/soc/fsl/imx-pcm-rpmsg.c:818:19: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (21 chars into 20 available) [-Wunterminated-string-initialization]
> >   818 |         { .name = "rpmsg-micfil-channel" },
> >       |                   ^~~~~~~~~~~~~~~~~~~~~~
> > drivers/iio/light/hid-sensor-als.c:457:25: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (21 chars into 20 available) [-Wunterminated-string-initialization]
> >   457 |                 .name = "HID-SENSOR-LISS-0041",
> >       |                         ^~~~~~~~~~~~~~~~~~~~~~
> > drivers/iio/light/hid-sensor-prox.c:366:25: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (21 chars into 20 available) [-Wunterminated-string-initialization]
> >   366 |                 .name = "HID-SENSOR-LISS-0226",
> >       |                         ^~~~~~~~~~~~~~~~~~~~~~
> > 
> > Increase the length to 24, slightly more than is currently being used by
> > the affected drivers. The string is used in '%s' format strings and via
> > the module code, which appears to do its own length encoding. This size
> > was chosen because there was already a 4 byte hole in the structure:
> > 
> > struct platform_device_id {
> >         char                       name[20];             /*     0    20 */
> > 
> >         /* XXX 4 bytes hole, try to pack */
> > 
> >         kernel_ulong_t             driver_data;          /*    24     8 */
> > 
> >         /* size: 32, cachelines: 1, members: 2 */
> >         /* sum members: 28, holes: 1, sum holes: 4 */
> >         /* last cacheline: 32 bytes */
> > };
> 
> Since there is no even potential ABI breakage, I'm fine with the change.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This definitely breaks ABI on 32-bit architectures such as i586, because there
is no gap from alignment. Perhaps, this also make the commit not suitable for
backporting to stable branches?

I recently stumbled on build failure on v5.10.239 for i586:

  make: Entering directory '/usr/src/kernel-source-5.10'
    DEPMOD  5.10.239
  depmod: FATAL: Module index: bad character '�'=0x80 - only 7-bit ASCII is supported:
  platform:jsl_rt5682_max98360ax�
  make: *** [Makefile:1786: modules_install] Error 1
  make: Leaving directory '/usr/src/kernel-source-5.10'

With this patch not applied "jsl_rt5682_max98360a" have terminating '\0'
truncated due to PLATFORM_NAME_SIZE being same as the string length and
concatenated with the following binary data:

        {
                .name = "jsl_rt5682_max98360a",
                .driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
                                        SOF_RT5682_MCLK_24MHZ |
                                        SOF_RT5682_SSP_CODEC(0) |
                                        SOF_SPEAKER_AMP_PRESENT |
                                        SOF_MAX98360A_SPEAKER_AMP_PRESENT |
                                        SOF_RT5682_SSP_AMP(1)),
        },

modpost then interprets it as an asciiz string concatenating with `driver_data`
resulting in bad characters.

  static int do_platform_entry(const char *filename,
			       void *symval, char *alias)
  {
	  DEF_FIELD_ADDR(symval, platform_device_id, name);
	  sprintf(alias, PLATFORM_MODULE_PREFIX "%s", *name);
	  return 1;
  }

creating in an incorrect alias, and this somehow breaks depmod in kmod 34.2
(maybe earlier).

Old kmod 30 successfully adds incorrect alias:

  $ modinfo snd-soc-sof_rt5682.ko | grep jsl_rt5682_max98360a
  alias:          platform:jsl_rt5682_max98360a
  alias:          platform:jsl_rt5682_max98360ax�

and 

  modules.alias:alias platform:jsl_rt5682_max98360ax� snd_soc_sof_rt5682

Perhaps, scripts/mod/file2alias.c should be updated with:

-	  sprintf(alias, PLATFORM_MODULE_PREFIX "%s", *name);
+	  sprintf(alias, PLATFORM_MODULE_PREFIX "%.*s", PLATFORM_NAME_SIZE, *name);

(Or even producing an error if more serious truncation occurs.)

Thanks,

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

