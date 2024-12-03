Return-Path: <linux-kbuild+bounces-4974-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 368999E26D9
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 17:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFC2D289442
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 16:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4EA1EE00B;
	Tue,  3 Dec 2024 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b="I4SqzXR5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mister-muffin.de (mister-muffin.de [144.76.155.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4B61E2613
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 16:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.155.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733242673; cv=none; b=rzT55owFwDgX6kAWQMo0AkdKE0miTzULdISWhgxmS5Xsih7Q3B7V9JHR7TNjevov/HFSgM/sNmse4te3vt4bDXpQ/AdP1wfUC097edwrNi5HJBUXsL6u1kTQktznvqLPQH5Hidk6D2qO/rkxJerQgK5iG//DVilwoqLPVfVceX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733242673; c=relaxed/simple;
	bh=Mp822f7t9NTXdbjoFK6m0qu8tNFS/6pieNkeS5hYKsI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bDLa8sL07725KKqGRWYYxbU6fdJZByU8WBCHGEAz3zojua0X2U76HdKrtPGa2Rd186rMIljDXXubTYOjyeqbe1xDKq/iCAPBfvN2ppxbWEHrpYWnA1xdbGs6x0P/1BG+URWEheufxW+TPePp3p9p8YDP3RCur4zlAqctdqgG5J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de; spf=pass smtp.mailfrom=mister-muffin.de; dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b=I4SqzXR5; arc=none smtp.client-ip=144.76.155.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mister-muffin.de
Received: from localhost (ipb218f889.dynamic.kabel-deutschland.de [178.24.248.137])
	by mister-muffin.de (Postfix) with ESMTPSA id 93ADF79C;
	Tue,  3 Dec 2024 17:17:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mister-muffin.de;
	s=mail; t=1733242668;
	bh=Mp822f7t9NTXdbjoFK6m0qu8tNFS/6pieNkeS5hYKsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I4SqzXR5VWSBu58fWvlH37p8U2d+EAhl7ibdHE/lLTqVT/eLwM1g9HRhJBoXFu66q
	 BOjqYDj92qE8/wy0QASytEdUrxV+rSnydk/NtmBLE890TOj5gwXv2BAjhzajPHV6/b
	 HD63fklgSdtVe/Dldt2KsYzez3vzt7xq8yuIh4eY=
From: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Subject: [PATCHv4 0/1] kbuild: deb-pkg: allow hooks also in /usr/share/kernel
Date: Tue,  3 Dec 2024 17:17:34 +0100
Message-Id: <20241203161735.2411494-1-josch@mister-muffin.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAK7LNATQ6Gu6D6gpH3htJS=e136zPBQbCxtMLZU3YZx_bkWiLg@mail.gmail.com>
References: <CAK7LNATQ6Gu6D6gpH3htJS=e136zPBQbCxtMLZU3YZx_bkWiLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Quoting Masahiro Yamada (2024-12-03 15:24:10)
> > Unless I'm misunderstanding the old code, the existing script *does* create 
> > /etc/kernel/*.d/ (That's the "- mkdir -p" line above) so I wanted to
> > preserve this behaviour even with more than one directory in KDEB_HOOKDIR.
> > Do I misunderstand something?
>█
> Right. The existing code does create empty directories, which
> are unnecessary.

Okay. I had assumed that their creation was intentional.

> > Are you saying that with this change, no
> > /etc/kernel/*.d/ should be created anymore? Why?
>█
> The 'mkdir' is unnecessary regardless of your patch,
> unless I am misunderstanding the code.

Yes, the mkdir is not necessary as far as I can see. Packages that do
install hooks will take care of creating these. It doesn't have to be
the linux kernel image package that takes care of creating them.

> Judging from your cautious approach and verbose changes, I
> assume you are trying to avoid any risks (a common trait
> among many contributors).

That is correct. I hope that such an approach is considered desirable?

> That said, I understand you are not motivated to strive for
> clean code at all costs. Once you commit the run-parts
> changes, you may feel your work is done. However, as the
> maintainer, I must manage this code for many years,
> so I aim to proactively remove unneeded code.

I understand. I don't see a problem changing the patch in a way such that you
feel that you can take responsibility for it in the long term. Thank you for
taking the time to explain this to me. It is really much appreciated and I know
that you don't have to. Thank you!

That being said, please do reach out to me if there are problems with my
contributions later on. I am also the contributor of the new functionality in
run-parts, so should there be issues with debianutils, you can also contact me
about problems with using run-parts on multiple directories as well.

> I have decided to take responsibility for cleaning up this
> single line myself:
>█
> https://lore.kernel.org/linux-kbuild/CAK7LNARU=M282fAOOgzPOBPtDNFPjH8To9eK2vYstWxkEDEEPA@mail.gmail.com/T/#t
>█
> If something breaks due to missing directories,
> it will be my fault, not yours.

Thank you. My new patch (v4) in the next mail now is on top of your
change above.

> Now that the dummy directories are gone from the linux-image
> package, please prepare the next version without the
> "pre-create the first hook directory" stuff.
>█
> A few more requests.
>█
> Please add the version number (the next patch will be v4?) like others do.
> And "kbuild: deb-pkg:" as the patch subject.  ('git log
> script/package/buildeb' to see examples)

I think I have taken care of these issues now.

Thank you!

cheers, josch


Johannes Schauer Marin Rodrigues (1):
  kbuild: deb-pkg: allow hooks also in /usr/share/kernel

 scripts/package/builddeb | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

-- 
2.39.2


