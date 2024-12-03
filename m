Return-Path: <linux-kbuild+bounces-4949-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA449E1397
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 07:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DBFF161B46
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 06:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA4618132F;
	Tue,  3 Dec 2024 06:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b="XSuTG9FO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mister-muffin.de (mister-muffin.de [144.76.155.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB49126C13
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 06:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.155.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733208896; cv=none; b=sL2XufJIERvQlOBIQ10hiIbPutVlIcUCEcbl9ZrMwBcS+h1Qau2X7QHohM3v4YTRAMq5yrBkMewSLVD+a6s6IJF//NQE1HiUjGh4j75CAuyZHXigj6k6PBXGfgLa3M/LZ5bJUBuivNDCJjpH9Ag2FH3/xKBkd9QuNgR24dI5Xco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733208896; c=relaxed/simple;
	bh=9EdKQsJ+XfvxMkoUK06TEEWOcnZRGqeyleEYq1Ol4io=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oPOmZIKV6Cb8HZf5pkC/4oQ9nGWeUBPmP8xUi1Rth3HfrjQ5lh/gxfua2Yr4K0MH5y27hBWBU1jcfVyi6f/DwDhv7G4c8r1yb4ArSECGNDUMTsfA4qS1bmtfCap1JCFbCH6ONotxLy+6usiO7/z5YMvZCP6dbve44oHg3pSCJ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de; spf=pass smtp.mailfrom=mister-muffin.de; dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b=XSuTG9FO; arc=none smtp.client-ip=144.76.155.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mister-muffin.de
Received: from localhost (unknown [37.4.230.225])
	by mister-muffin.de (Postfix) with ESMTPSA id 0345B2E0;
	Tue,  3 Dec 2024 07:54:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mister-muffin.de;
	s=mail; t=1733208891;
	bh=9EdKQsJ+XfvxMkoUK06TEEWOcnZRGqeyleEYq1Ol4io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XSuTG9FOJnbLx3MNHLI3oSJh3ipgIb0pt3pjuoF1nbpTHjwdwAJGpLkduXMaH/ziR
	 EWHdB0rvhs9hcZgl1mO0qNl9W+zZcSU9wZyjXaeQfnqN0YYxjQcHLdoy40GiFLQ3hr
	 CBQ7yhZr56N00LdXwWjjz4jpGZPVlxqi9UrGARCc=
From: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Subject: [PATCHv3 0/1] scripts/package/builddeb: allow hooks also in /usr/share/kernel
Date: Tue,  3 Dec 2024 07:54:40 +0100
Message-Id: <20241203065441.2341579-1-josch@mister-muffin.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAK7LNARarqG2Okacbp4TKJAFz9OagB2NF=qs-Cq2rzOW4CA2Bg@mail.gmail.com>
References: <CAK7LNARarqG2Okacbp4TKJAFz9OagB2NF=qs-Cq2rzOW4CA2Bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Quoting Masahiro Yamada (2024-12-03 07:15:17)
> On Tue, Dec 3, 2024 at 2:59 AM Johannes Schauer Marin Rodrigues
> <josch@mister-muffin.de> wrote:
> >
> > Hi,
> >
> > Quoting Masahiro Yamada (2024-12-02 16:42:02)
> > > > @@ -84,7 +93,26 @@ install_linux_image () { # Tell initramfs builder
> > > > whether it's wanted export INITRD=$(if_enabled_echo CONFIG_BLK_DEV_INITRD
> > > > Yes No)
> > > >
> > > > -               test -d ${debhookdir}/${script}.d && run-parts --arg="${KERNELRELEASE}" --  arg="/${installed_image_path}" ${debhookdir}/${script}.d
> > > > +               # run-parts will error out if one of its directory arguments does not
> > > > +               # exist, so filter the list of hook directories accordingly.
> > > > +               hookdirs=
> > > > +               for dir in ${debhookdir}; do
> > > > +                       test -d "\$dir/${script}.d" || continue
> > > > +                       hookdirs="\$hookdirs \$dir/${script}.d"
> > > > +               done
> > > > +               hookdirs="\${hookdirs# }"
> > > > +               test -n "\$hookdirs" || exit 0
> > > > +
> > > > +               # If more than one hook directory remained, check version of run-parts. If
> > > > +               # run-parts is too old, fall back to only processing the first.
> > > > +               case \$hookdirs in *" "*) if ! run-parts --help 2>&1 \
> > > > +                               | grep -Fxq "Usage: run-parts [OPTION]... DIRECTORY         [DIRECTORY ...]"; then
> > > > +                               echo "E: run-parts >=5.21 is required for multiple hook     directories, falling back to $firsthookdir" >&2
> > >
> > > Same comment as in the previous version.
> > > If both /etc/kernel/postinst.d/ and /usr/share/kernel/postinst.d/ exist,
> > > can we assume the run-parts>=5.12 on that system?
> >
> >
> > since KDEB_HOOKDIR can now be any directories and any number of directories,
> > the question should rather be: if more than one directory from KDEB_HOOKDIR 
> > exists, can we assume that run-parts>=5.12 exists on that system?
> >
> > Personally, I'd prefer a best-effort fallback mechanism. The alternative would
> > be that kernel installation would just error out in case a (buggy) package on a
> > distro ships something in /usr/share/kernel/postinst.d/ but failed to also
> > declare a versioned dependency against debianutils. The error message cannot
> > (or rather only with considerable effort) tell the user *why* their kernel
> > installation errored out. By only considering the first hook directory
> > (probably /etc) in those situation, the kernel would succeed to install and the
> > hooks from the (buggy) package would be skipped. I understand that such a
> > behaviour comes with its own set of disadvantages. One could also argue, that
> > it is better to error out loudly in case of an error instead of hiding a
> > message prefixed with a "E:" in a bunch of console output when a kernel package
> > gets installed.
> >
> > What is your position on this question? What behaviour would you prefer? If you
> > strongly prefer the kernel installation to error out loudly if run-parts is too
> > old, then my next patch will implement just that. I think whether "we can
> > assume run-parts>=5.12" depends on what we declare to be the right way to hold
> > this feature. If we say "packages must declare this versioned dependency and if
> > they fail to do this then it is their bug and not ours" then yes, then we can
> > assume run-parts>=5.12 in case of multiple directories.
>█
> My preference is to pass the existing hook directories to run-parts.
> If KDEB_HOOKDIR specifies two directories and both exist,
> pass them to run-parts.

Done in this third version of my patch. Thank you for your reviews and your
patience with me! :)

cheers, josch

Johannes Schauer Marin Rodrigues (1):
  scripts/package/builddeb: allow hooks also in /usr/share/kernel

 scripts/package/builddeb | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

-- 
2.39.2


