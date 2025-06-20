Return-Path: <linux-kbuild+bounces-7577-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B2EAE124F
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 06:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CC634A5679
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 04:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E8718024;
	Fri, 20 Jun 2025 04:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3vTRbn+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20EC1CDFCA
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Jun 2025 04:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750392867; cv=none; b=mQK13AZvnCXAyMjtUgrxi5bJ862BkP+t0QjsDTBjHXHGqYLFwSakff/CYIgEbAghzwpvIZc+RV8MitRbLs97t0/v7B/nMPGOsQeo7BnvI9vlwewBl6bnyTIpliJ8B+4cxxWpfGP6zFv2sLsn3784kDzxsHwbyKGdJGKakOXTPcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750392867; c=relaxed/simple;
	bh=ykHMZ4Uhu5dGbGvrcNyKLLIyspyXTEysbuQpLS6fyB4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=oEW30mdJDihE5xGwxId9YuWQxgZwZUBhPH5IDnX6OTuv0QB9X257tf8VtQDFOn5XMIF3FsNz9fagEU+H8WR20hC8v98aZK+i+SidYDOp1yA3ZWNPHdAn9CMKrnNct4rXWoF6KW7kcgli+5dPLv9aehKhlL1F/Yle+7umG/CkJgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3vTRbn+; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2e999729ccbso844977fac.2
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Jun 2025 21:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750392864; x=1750997664; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FHjQHCHmkCUaeTza6Q8qX86uLuDrmQuOs0a/juGcKD8=;
        b=A3vTRbn+rZe49EjrAVJYrkcOxndmiNA41zBg2fASZD9QcSTc5F3G6CYQd9OFV22gLk
         hwjSsAgd5PKdir7UwuvH04f+Nt9nkH6pluXhxM3zdpxk2gcAkJyZ+jnS7E0OXSR1n/D7
         WN8G4szlKNFLdhaZ11AgLHF5J9buSBwL1CGIiroiAJ8EzRGeVi030kRDyJZJT6Bl9Eqe
         N6TrvQ6hErkwkIDb9Zw8YCRmAdvVCHNceEkbtgvK0L/jM4NC9SzEJq9au5+seJ1hIhm0
         3TSkOdLG0llSUl7O2tBAJnwfnjM8agvSO28rRcu6gndnN+6sRA/R0hy5PP7beEX8i2JL
         AcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750392864; x=1750997664;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHjQHCHmkCUaeTza6Q8qX86uLuDrmQuOs0a/juGcKD8=;
        b=sCxx1WcTFSuaS6+ysmNGJYhpSF3LyriRzu9qFf2ntqUgwlHlMucbBnHdvuKwNt9FHu
         3jSUEtoFV+PTOI/OlMwcxrfn3kNC6eKgWsV+WHb/ZCyniqFJr3ZZp/6aEJtCSO5N8yb4
         XXbRAul9Fc1Zy2AiMxV+nnLLlAwL53XjjmKvxY8VNu7+k8E1tbOK1Y3OrR17AkON9gip
         xpjIbH4pz5W70aAWGn/G0raLCh9Vaxdy2g5DbhyOEZ0l3jpZE7JA36UR2CTWToDJ+eAV
         ve6Y5DRwIjtUHpYJ8tAL1dsrboVveqr5ySaqLTW3R1nQIJ1Ima9XaPiG0YG5qR5hYdJO
         iJ0Q==
X-Gm-Message-State: AOJu0YxYl7ZrvBRlULYezcyOAMNqwqkKIx3LeFp9SCYvJb6m7KvZHNQU
	qOGOwSHogwC2qhWb9oGlO5iwc4ygHQ3GRFjCSkqciyVcpx3hnOTeoIA+Lo7IOVQepCySUZxIvFa
	HPIsjVhYmoZ78VyGmxi86BazspojB1IUJaVXN
X-Gm-Gg: ASbGncsKMZfe5u/25kbt+OBh2d6Z2gMTS/kN4TGFoMyJYKn+dTImGxG1G/51udv1huD
	8ZC0kOpVqr+FD+5N4xZQmrJabN/ouH2n1ae1QEauipNALCH4xNQptZS7MMYoT/kmtLqU45PMD/a
	OiUVsRxMXrTNVKPnmVmiSiyPjcf76siKGjwBhPau064Z8=
X-Google-Smtp-Source: AGHT+IFUTBc4qh70zh6SWl5hIvIksPzgIO22YUQtezDwqgeeglXzAiUa+wLimgAS5VqJIxYcJZhp1uKe6Y1RSd7BIuQ=
X-Received: by 2002:a05:6871:a693:b0:2d4:e101:13dd with SMTP id
 586e51a60fabf-2eeee3a030bmr1101216fac.1.1750392864361; Thu, 19 Jun 2025
 21:14:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "David F." <df7729@gmail.com>
Date: Thu, 19 Jun 2025 21:14:13 -0700
X-Gm-Features: Ac12FXz7mMkIcuOR9pmx9WppgTbphiNLKbTXzOa5i8HPFMWFi1NYIcfdGYdvi_U
Message-ID: <CAGRSmLuJmg38_Rai+3vDFHQUedFynNdo8ORjkKwS9w=V8qU_dA@mail.gmail.com>
Subject: Building x64 kernel on i686 broken in 6.12.
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I'm resending this since no response.   It appears something was
changed to address ARM64 and it broke building x64 on i686 which I've
done for a very long time.

Resending:


I always build both the i686 and x64 kernel on my VM which has changed
through the years from debian (several distros) to now devuan-chimaera
(couple years now). Last build was 6.6.x but now jumping to 6.12.x. I
can build the 686 version however, it won't build the x64 version and
gives me a dependency issue.

At first it was gcc-x86-64-linux-gnu, libssl-dev

I first updated libssl-dev, then the gcc-x86-64-linux-gnu with apt-get install

It now just says it doesn't like libssl-dev but it's installed and up to date.

pkg-architecture: warning: specified GNU system type x86_64-linux-gnu
does not match CC system type i686-linux-gnu, try setting a correct CC
environment variable
dpkg-buildpackage --build=binary --no-pre-clean --unsigned-changes
-R'make -f debian/rules' -j1 -a$(cat debian/arch)
dpkg-buildpackage: info: source package linux-upstream
dpkg-buildpackage: info: source version 6.12.32-amd64-1
dpkg-buildpackage: info: source distribution chimaera
dpkg-buildpackage: info: source changed by root <root@devuan-chimaera.acme.com>
dpkg-architecture: warning: specified GNU system type x86_64-linux-gnu
does not match CC system type i686-linux-gnu, try setting a correct CC
environment variable
dpkg-buildpackage: info: host architecture amd64
 dpkg-source --before-build .
dpkg-checkbuilddeps: error: Unmet build dependencies: libssl-dev
dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
dpkg-buildpackage: warning: (Use -d flag to override.)
make[2]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 3
make[1]: *** [/usr/src/mydisk/kernel/linux-6.12.32-64/Makefile:1566:
bindeb-pkg] Error 2
make: *** [Makefile:224: __sub-make] Error 2

root@devuan-chimaera:/usr/src/mydisk/kernel# apt-get install libssl-dev
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
libssl-dev is already the newest version (1.1.1w-0+deb11u3).
The following packages were automatically installed and are no longer required:
  libwpe-1.0-1 libwpebackend-fdo-1.0-1 linux-image-5.10.0-16-686
Use 'apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 298 not upgraded.


HOWEVER, I got the build to start by doing this:

DPKG_FLAGS="-d" make -j$(nproc) ${extraversion} bindeb-pkg

It built everything, stripped/signed all the modules, look like it was
going to finish then bam:

dpkg-deb: building package 'linux-image-6.12.32-amd64-mine' in
'../linux-image-6.12.32-amd64-mine_6.12.32-amd64-1_amd64.deb'.
dpkg-buildpackage: error: make -f debian/rules binary subprocess
returned exit status 2
make[2]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 2
make[1]: *** [/usr/src/mydisk/kernel/linux-6.12.32-64/Makefile:1566:
bindeb-pkg] Error 2
make: *** [Makefile:224: __sub-make] Error 2

So still stuck.  Can someone help with what I need to do for it to
build the x64 kernel on i686 linux like i've been doing for over a
decade.

