Return-Path: <linux-kbuild+bounces-7578-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B5AE140A
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 08:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CBD43AEDB8
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 06:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1261A288;
	Fri, 20 Jun 2025 06:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=svenjoac@gmx.de header.b="ehpZT/o9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D430E844
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Jun 2025 06:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750401429; cv=none; b=pL8F3q5UdvQp3Rmd92EY9dmdD5EBDObaFZV6AnwXACGzEQpPzjVqVsuGuX1k7anR1RQ/0VWmI8NER+T9Fhq4lLmSJbalXYOzo4K9hz1JXWY1WgJxjz7FSPGOiXF/rYvZCU2a2i4w/DBOxKs/GvpNgDDLzyaloOeMBJ2jV+Hd7Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750401429; c=relaxed/simple;
	bh=CICCNrCuCiviSYUF11a6TTuf//Pp/4iGEDAYH/qxtn4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IPmr090lHMx0fqxZf6NB3v2yPYfJ0zE28n1Z6xFMwl4i6I+O31Im+gkCZwk6ZfKpNU04nD/eoFgv6i4uee7gcAghCnaOxyejNvh22/2F81dH3yV30S9y3JYTfXP6YogubKqanC3WTuFLeuWVPFZj3bWCOanM6PktrqVdL3o+w8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=svenjoac@gmx.de header.b=ehpZT/o9; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750401422; x=1751006222; i=svenjoac@gmx.de;
	bh=ReNSro71SB8fbAVRc64NEygs6uly+xMx2FXzVnJ2GsQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ehpZT/o9ETiDHznsG5yExxlMCJayM/UckCzS08ufFZfmPfrFjznZjF5TAyb9ZB8d
	 +o16ebf+We4rr72aeBEhwEiEHpx5wX6q28A4AajfhEp2X3WKATSG9C/QnGeQ3kdom
	 P72yEjEj1e4Cww46sRSYVPt06ba++RbzWlBWZA1+ynvoBFIDsVbQSQXWM/S+7TzND
	 JstDNRTcl6A4oG+65Nth0rOv3Ke8Kmncl+RcXWJwlzE1Vp5PjHzcwMqv3B4fHwyP6
	 tQykOdbX72JlJ5Rsw9s+xIU4bE9uDAbJNMmplscoYd+Fzsrj16W+NW88ELehM1QbA
	 XUm0gXaC69KNQkfo0A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([87.168.51.196]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MWih0-1uHdQs2RTM-00VMaB; Fri, 20 Jun 2025 08:37:02 +0200
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 093498011E; Fri, 20 Jun 2025 08:37:02 +0200 (CEST)
From: Sven Joachim <svenjoac@gmx.de>
To: "David F." <df7729@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: Building x64 kernel on i686 broken in 6.12.
In-Reply-To: <CAGRSmLuJmg38_Rai+3vDFHQUedFynNdo8ORjkKwS9w=V8qU_dA@mail.gmail.com>
	(David F.'s message of "Thu, 19 Jun 2025 21:14:13 -0700")
References: <CAGRSmLuJmg38_Rai+3vDFHQUedFynNdo8ORjkKwS9w=V8qU_dA@mail.gmail.com>
Date: Fri, 20 Jun 2025 08:37:01 +0200
Message-ID: <87a562apgy.fsf@turtle.gmx.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Provags-ID: V03:K1:nyTqP/H5xdxmLkwEjblQPCKEF4b7i9Wb7136mr1rcJ89cpI3hIC
 gZOG9DEWywz0e6T0ArQcCVu3LDNBblfeFetuVjtMY5J7s6AbVe85Qch409nnW1tsLzgaKdJ
 ECt7E5FPcepMwFnEGD12Mvq6reIzJ5Ys9Q9lSUFcQjR6Q3T8TBIR7+mYg2F1LHyAYthXsSX
 IWk70AK0QWyMo2Ml4xknQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b2Cl+xslRco=;X6uOtiyOoKed6ZQ88cdDyxOiRFa
 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
 gToM=

On 2025-06-19 21:14 -0700, David F. wrote:

> I'm resending this since no response.   It appears something was
> changed to address ARM64 and it broke building x64 on i686 which I've
> done for a very long time.
>
> Resending:
>
>
> I always build both the i686 and x64 kernel on my VM which has changed
> through the years from debian (several distros) to now devuan-chimaera
> (couple years now). Last build was 6.6.x but now jumping to 6.12.x. I
> can build the 686 version however, it won't build the x64 version and
> gives me a dependency issue.
>
> At first it was gcc-x86-64-linux-gnu, libssl-dev
>
> I first updated libssl-dev, then the gcc-x86-64-linux-gnu with apt-get install
>
> It now just says it doesn't like libssl-dev but it's installed and up to date.

You need to install libssl-dev for both the host and the build
architecture, so install libssl-dev:amd64.

Alternatively, if you do not need the linux-headers package, use the
pkg.linux-upstream.nokernelheaders build profile, like so:

$ DEB_BUILD_PROFILES=pkg.linux-upstream.nokernelheaders make [...] bindeb-pkg

See commit e2c318225ac1 ("kbuild: deb-pkg: add
pkg.linux-upstream.nokernelheaders build profile").

Cheers,
       Sven

