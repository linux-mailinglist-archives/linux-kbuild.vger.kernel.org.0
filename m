Return-Path: <linux-kbuild+bounces-10943-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KgOHRlCfGltLgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10943-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 06:31:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB380B750B
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 06:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C4AF3013D53
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 05:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8022F2C2340;
	Fri, 30 Jan 2026 05:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlyFIn7Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF33211A09;
	Fri, 30 Jan 2026 05:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769751062; cv=none; b=MLIZerSjtDbd6etDh37J9f6LgnCYFflR0cMe4UyGgCB7Nke2TMNVGAMgpV8lxmOMU+cZLgwd6Xd1km6M/yDWhSWY/1xh+b9BYRNz0rMRv1E1Q7uSZHDq+0jZowon4oyOdoJBE8souP4QBrC1PIKWBADTaov+lTfT300kIu9M4F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769751062; c=relaxed/simple;
	bh=Xcz+1hrwH2S09R86kbUvdcrXAyd2XwN+/A2GnyKpG3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2WNuUFCHQfGond2b3YkERgPkHxabSvVEY+pCyA46KTdFMZD/0gTssDV9m/lW28C9/u0L/IPjCfz2JMRQNgDGI307GEW8/SiFb05dAGh62vN5tQn1YWkLaLXesuWOn2PkS0Ve+MsQ9jEQ0aNkwpss+/iovm5Q+z9jl583XBoQ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rlyFIn7Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC05BC4CEF7;
	Fri, 30 Jan 2026 05:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769751061;
	bh=Xcz+1hrwH2S09R86kbUvdcrXAyd2XwN+/A2GnyKpG3Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rlyFIn7Z5wunFY071IsLS8MmnsBIyOq9alTjn//fovfHANx0HER8Etx1RwVqgxbGo
	 i4gSkq8ZXlNL6G8UjDCCsIvS240P5wfAaXY0nu6zMV4ASLpyASv7CW9brypZWVFXYw
	 GPkTI1XeClyioPDWugWLy74mh2xEnqSaP3H6XEHophh0symlIj+V4WoAYcKjwICz8E
	 fli18qCKZWPLGRLL9F/HLWakajrSyB3ANjd5fqyuxvCkqAYHvA6YNrq78wAD0H2nl1
	 e3Dk5121QJiRY4PswlmTSoxrldHMET62+aEvvYizKe/Szo51divl4+f4BHNfXNQ9yw
	 LziJxz3N+AfHQ==
Date: Fri, 30 Jan 2026 06:30:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rong Zhang <i@rong.moe>, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] kbuild: install-extmod-build: Add missing python
 libraries
Message-ID: <20260130063056.72fbe458@foz.lan>
In-Reply-To: <20260130011106.GA359714@ax162>
References: <20260129175321.415295-1-i@rong.moe>
	<20260130011106.GA359714@ax162>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10943-lists,linux-kbuild=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rong.moe:email]
X-Rspamd-Queue-Id: CB380B750B
X-Rspamd-Action: no action

Hi Nathan,

On Thu, 29 Jan 2026 18:11:06 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> + Jon, Mauro, and linux-doc
> 
> FWIW, this ended up in my spam folder but I saw it on linux-kbuild.
> 
> On Fri, Jan 30, 2026 at 01:49:55AM +0800, Rong Zhang wrote:
> > scripts/lib has been moved to tools/lib/python recently. Since then, I
> > got a regression while building out-of-tree modules with W=<anything>
> > (1/2/3/c/e):  
> 
> Hmmm, the W=<anything> bit seems wrong (or at the very least, c/e)... we
> should probably change that to just being enabled at W=1 (but that is
> tangential to this patch).
> 
> >   $ make -C /lib/modules/6.19.0-rc6/build/ M="$(pwd)" modules V=1 W=1
> >   [...]
> >   make -f /usr/src/linux-headers-6.19.0-rc6/scripts/Makefile.build obj=. need-builtin=1 need-modorder=1
> >   # CC [M]  mod.o
> >   [...]
> >   # cmd_checkdoc mod.o
> >   PYTHONDONTWRITEBYTECODE=1 python3 /usr/src/linux-headers-6.19.0-rc6/scripts/kernel-doc.py -none mod.c


This sounds really weird, as it is trying to run scripts/kernel-doc.py
instead of tools/docs/kernel-doc. Does the out-of-tree Makefile
override KERNELDOC variable? The current version contains:
	
	KERNELDOC       = $(srctree)/tools/docs/kernel-doc

But somehow it is using the old version before the renames:

	KERNELDOC       = $(srctree)/scripts/kernel-doc.py

As you can see, kernel-doc.py was renamed to just kernel-doc at the
patches that moved it. Inside kernel-doc, there is this code:

	LIB_DIR = "lib/kdoc"
	SRC_DIR = os.path.dirname(os.path.realpath(__file__))

	sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))

which auto-detect its location and ensures that the library location
will be relative to it.

With that, if you call it outside the kernel tree, like here (on this
example, kernel root tree is at linux-next):

	$ linux-next/tools/docs/kernel-doc linux-next/drivers/acpi/ -none
	Warning: linux-next/drivers/acpi/fan.h:83 function parameter 'speed' not described in 'acpi_fan_speed_valid'
	Warning: linux-next/drivers/acpi/fan.h:83 function parameter 'speed' not described in 'acpi_fan_speed_valid'

it works just fine.

the realpath() function even warrants that a symlink will equally 
work(*):

	$ linux-next/scripts/kernel-doc linux-next/drivers/acpi/ -none
	Warning: linux-next/drivers/acpi/fan.h:83 function parameter 'speed' not described in 'acpi_fan_speed_valid'
	Warning: linux-next/drivers/acpi/fan.h:83 function parameter 'speed' not described in 'acpi_fan_speed_valid'

(*) one of the patches of the rename patch series added a soft link:

	$ ls -lctra linux-next/scripts/kernel-doc
	lrwxrwxrwx 1 user user 24 Jan 23 08:53 linux-next/scripts/kernel-doc -> ../tools/docs/kernel-doc


Btw, I did a very quick test here, using an old OOT project I have
at github:

	https://github.com/mchehab/xr_serial
	
Changing its Makefile to:

	obj-m := xr_serial.o

	SRCTREE=../linux-next
	KERNELDIR ?= $(SRCTREE)/tools/build
	KERNELDOC = $(SRCTREE)/tools/docs/kernel-doc

	PWD       := $(shell pwd)

	EXTRA_CFLAGS    := -DDEBUG=0

	all:
	        $(MAKE) -C $(KERNELDIR) M=$(PWD)

	docs:
        	$(KERNELDOC) .

	modules_install:
        	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install

	install: modules_install

	clean:
        	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions vtty built-in.a  cdc-acm.mod modules.order Module.symvers xr_serial.mod

There, building docs didn't crash:

	$ make docs
	../linux-next/tools/docs/kernel-doc .

(none was produced, as xr_serial doesn't contain any kernel-doc
stuff, but still the tool worked properly).

It sounds to me that Rong may be using a Makefile on his OOT project
that was not updated to pick the right kernel-doc tool.

> >   Traceback (most recent call last):
> >     File "/usr/src/linux-headers-6.19.0-rc6/scripts/kernel-doc.py", line 339, in <module>
> >       main()
> >       ~~~~^^
> >     File "/usr/src/linux-headers-6.19.0-rc6/scripts/kernel-doc.py", line 295, in main
> >       from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
> >       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   ModuleNotFoundError: No module named 'kdoc'
> >   make[3]: *** [/usr/src/linux-headers-6.19.0-rc6/scripts/Makefile.build:287: mod.o] Error 1
> > 
> > Fix it by installing python libraries from tools/lib/python.
> > 
> > Fixes: 778b8ebe5192 ("docs: Move the python libraries to tools/lib/python")
> > Signed-off-by: Rong Zhang <i@rong.moe>  
> 
> Thanks, this seems to be correct to me.
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> Nicolas, do you want to take this via kbuild-fixes? This should probably
> have a 'Cc: stable@vger.kernel.org' on it?
> 
> Hmmm, now that I am looking at -next, Jon's move of scripts/kernel-doc
> to tools/docs/ in commit eba6ffd126cd ("docs: kdoc: move kernel-doc to
> tools/docs") in that tree without adding tools/docs to this list breaks
> this exact same scenario, right?
> 
> > ---
> >  scripts/package/install-extmod-build | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
> > index 2576cf7902dbb..a15de610afed3 100755
> > --- a/scripts/package/install-extmod-build
> > +++ b/scripts/package/install-extmod-build
> > @@ -20,6 +20,7 @@ mkdir -p "${destdir}"
> >  (
> >  	cd "${srctree}"
> >  	echo Makefile

> > +	echo tools/lib/python # required by scripts

I don't know exactly how the out-of-tree logic works, but at least
in my eyes, this doesn't sound the right fix. 

Regards,
Mauro

Thanks,
Mauro

