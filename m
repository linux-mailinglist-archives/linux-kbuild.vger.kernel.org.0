Return-Path: <linux-kbuild+bounces-7500-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED0EAD9776
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Jun 2025 23:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E973189E74C
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Jun 2025 21:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C431A1A3168;
	Fri, 13 Jun 2025 21:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8+UsL5g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF8C1A08CA
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Jun 2025 21:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749851192; cv=none; b=b3LColTmR5aiwtV7FqDbOikLauXd7z3n/P7la+yV7+10qkQLIU/HF6bZhHY8LKZccSV/zf211hLDikiMF6jLpPjDMqwhzLSGSZOmgwCcO6CyPMi6GAtOzAQqp2ej0oZbdzWCujcTZk9qYO4c4+JkGWugEOZ18NIpGvBa4H9ikCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749851192; c=relaxed/simple;
	bh=fj8LN2mnDTFOZh3iwWAWyaW+xepnuETuw152jVEjAs8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=QxjQv1Y5r68qFOX9OKGUN+ScN7TRoiXxnKocu3nw3YykqHh1wtDgd0cSFlUcL6MwYV/J5EZLyVDCN9iqlbzUDcc7e9Po7WCy0d11i/vyAm78ZbDAGKibgIUn9xu5L4OLrEgPDHwwQpb0l+NgdOOQcIiZPmR+sAuoujUNoEiZcrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8+UsL5g; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-606440d92eeso1162407eaf.2
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Jun 2025 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749851190; x=1750455990; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mgFmUpaLbu3snZc7ueu/9kJ5IZgsr4RcaPHlBaXrARo=;
        b=X8+UsL5g8W7op8o2x1hUjNjsEZlag57EQ6hck0Kln3+yZIeuvautoQ+Fo091RwgguG
         VuST9amQ/z3bdSndWy4nlT+ka+lv7QmLqsNycidhZnKJXFAKeieUlJeWZSiEjzk1bU13
         sH8l6hjzjWkeHrDHkhdiuI+yHZlvHyHZe8v3OjaSpeJugoi9erNHr8fN/R28us5H71cN
         4qQsx+LpDe6zpQIFqQteshh+MRxJjwiBD3ehlbOVtAjifvkI/YFOsDhaBRh/uhcmaBT+
         geKyzUcEOL8A4ASn6Dxhvf6Ms2af3U81CF5fljxpxLILk37rHGCHPY1QHzkaA0QM+MrN
         QA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749851190; x=1750455990;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgFmUpaLbu3snZc7ueu/9kJ5IZgsr4RcaPHlBaXrARo=;
        b=h9FGSzqUmkJ5fPcBexaGZvCMeKTowooJF/BhJRzYWesxxPbkihV7ps+lOJsGbFHLzY
         /D3/TqL07cWbzXkUV2ml1PN/b7rSIs6yG/Ci8ZsvIAxIMYrW1OTMiqZEQKj43CicnpoS
         PaH+Kh/7Oemyt59Z+i0XfLOzF2ETIcimsYkmZ3YDjiJK6PrbPngslIoYvFiRW5ZncHFJ
         PIlkeTC8Vd9vJgtPNrbIg1Ob50C/WrcV9Vx0IeJ/jiRe0Eh4HViKHojXUEb7Erz+C9VF
         /Gr7ZEgDOqWKrDkl1Ml/177L/Jo1Tql5JjaQJgle/ZGL0utJDRShCe6LyWQKLCoWn6TY
         hiBA==
X-Gm-Message-State: AOJu0YwrNNnJ4GNxYPXEBFn+nzoDjHGdxXOEBFB9nQXejZslw2VmKLzC
	gz5PHOdlSGJz5O/OSnxWlWE1YFzM7HBLZdiguzYlMvTY92IKhhKOXjT8p4iyFi/PVWYkRme+cnr
	wMfsvsAUeptv0vS9UqvNpVqsJdGwz+seLrjp8
X-Gm-Gg: ASbGncs44oJR7syK1Gmxb0pEiTJWDkg/3R/AnyXAwY2P11yi/PaAANRaJGGi6oR6shm
	kBP9w9MxvcaVq9CnjKAI7tsULM+xZCpjLMlmSDQEQFdHwDt+K/Vtcv2Jk4e9OzMartALQVdFr7Y
	NSJwZ8fGV3FSeQMaEtHT/PmXIM2i1cQCMLnR3MHjQ3m0U=
X-Google-Smtp-Source: AGHT+IGfMZ5iyqcjBRRHBLwo9uo0bfD/tRzcdBKUyGVf+3WcVGyFVic8rDz25isYxqzw1kA5R8Tao0CBMbRolmz8Zk4=
X-Received: by 2002:a05:6870:b488:b0:2c1:b4ce:e43c with SMTP id
 586e51a60fabf-2eaf0847f01mr843546fac.21.1749851189895; Fri, 13 Jun 2025
 14:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "David F." <df7729@gmail.com>
Date: Fri, 13 Jun 2025 14:46:18 -0700
X-Gm-Features: AX0GCFvuwuBdGb1CKgqmOEtMztSQqQv9FhXxOto0RHq9ml7F1itPcSlzPiJypfU
Message-ID: <CAGRSmLsa--9ZkkpwMqE-jgV=b_a9UKhAsmGJEx=Y3zYa0oFgCQ@mail.gmail.com>
Subject: Unable to build linux kernel 6.12.32-64 on devuan i636?
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

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

