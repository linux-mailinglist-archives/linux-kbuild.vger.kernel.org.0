Return-Path: <linux-kbuild+bounces-1771-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B58BBF39
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 06:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F8B21F216D1
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 04:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A32184D;
	Sun,  5 May 2024 04:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zqn6PL5Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E336815A8;
	Sun,  5 May 2024 04:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714884932; cv=none; b=NCSINQ1ZI28LQU/qw3yUFSC0TbN4D1E/sZfhRj3eosfseITWlJYvyXYOVqHY9Falf9zGb+nvZrCVRG/VR/H0OafH4Af3tJiXEI+snWWvdGoDpgrPz2aLHWXMSOVj/8pWxTJCOUwNdnOG8NFhYp1wGcOkBbFWTnWiIVkOQEeX3Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714884932; c=relaxed/simple;
	bh=xbhjLy7QQi8imRqNOc0Votf1mG0I43W3i1qsh+O+skI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwfjS5a5uWOSvUhDzd7PvqMOCG8rGXxk171Odq70nDDOAWC/BlkFhZWcGRExLRkfvOaufynZqahwNk9lRbAxiJQ95lih7YPm3KNKI/aO1qAsFftrtU83rX3z/2HQSJgaCnCN1aIp2HD1gvtCNcR/0hB/mvfkKmkCCD35ve8VJ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zqn6PL5Q; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a59a387fbc9so182968866b.1;
        Sat, 04 May 2024 21:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714884929; x=1715489729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wE3YC1TeUYKgZ6zIEpaK2M8eOvPXoKAulTsczzk25cA=;
        b=Zqn6PL5QsZw7LbAASrcb24zgQlmoC3/jJFb+0kSQdLolqqViPd9CPqqGFdL2yAC+WQ
         nDTNGJ/Y7uixBiXkCcFMZUf94vJUrw8Bv7yQQo+yX6Oyhy9/VwDggKib9Oa6XEAnzfdA
         alm/IuEDjcanXCkZ9xG6OdUc1cDcyZmZE8llJPVMjzkBanrNnzOjvRcTxfTWr2ZdOna8
         lcH6M/DND5PkfI/NRYTuJ0EVkKOnnTlIOkYvVNyGIGlQM56gJYkiU8uvbMy6SSJ+JPub
         BIfMoHWEFRvgMnKLro4MvxlK0r7NRoC5bOSff2YJ0McQwHiOsgAvrxUtQrrR5HIjkIXb
         Etaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714884929; x=1715489729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wE3YC1TeUYKgZ6zIEpaK2M8eOvPXoKAulTsczzk25cA=;
        b=CrWGTRHv4rNAthP1mvxHdToTPPS/KVK6R0atJeF1ZG6Tu7TxiTFv1QjP4i8VJ/fh3p
         0hBqo0FBuryyoiE6GKGjXzivpn7VsUa3ptmBBlV1edIwo90KhsHEQlv+C8YI+oBn2oIq
         L2f153IGudeSwfgZh0dVThUk5gqn07e3J0SsIMu870q385CS2PLMHHwdigWXf0+3crUE
         taaKjgnYuYLkVGWSHsxYKXMer8Cxo9h3zk+BFBkfSsNvj5JJ6scnGOh4XW3U1m3pDIM5
         yeonx7knIX1+S+bDqAFWKt4s6+JzdJqlezB3NQqqFpdVayameJ/UZhVUS+bVJIEi8UG2
         VpPg==
X-Forwarded-Encrypted: i=1; AJvYcCWH7TpljafO2fBw0FY/5tUPhFCsSHZ9ZoIltxel2Lherqd11vyhsy2FQlf57wZXsiWn7Cqx13/QatpppbNh3Xw7hVCgPd9LtfGUDvWy5VkM5ktZarPZVDW+EUb3sDmY5BkcKjxgAhls+4il
X-Gm-Message-State: AOJu0YyJjgiTc9dpnbxlerW+U/jMw5z3vMK4PNP+EREoUVx+jRiJTb70
	kPGIQqxMpjGwFKD1aefdJ8Y+YYLy+gpV6QqIL3lXftZqs99Gxs1V
X-Google-Smtp-Source: AGHT+IE7xB6mr4BvHmWVm4ONwhj7vbYgt6+zAD0rzKuucAEn7BMqQoJlSz1jQ9lE0RZN9et6Op2pxw==
X-Received: by 2002:a50:d783:0:b0:568:c6a2:f427 with SMTP id w3-20020a50d783000000b00568c6a2f427mr3933869edi.27.1714884928811;
        Sat, 04 May 2024 21:55:28 -0700 (PDT)
Received: from gmail.com (1F2EF54C.unconfigured.pool.telekom.hu. [31.46.245.76])
        by smtp.gmail.com with ESMTPSA id ev11-20020a056402540b00b0057000a2cb5bsm3546973edb.18.2024.05.04.21.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 21:55:28 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Sun, 5 May 2024 06:55:25 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [GIT PULL] Kbuild updates for v6.9-rc1
Message-ID: <ZjcRPelwZP34N42s@gmail.com>
References: <CAK7LNARXef6Myb_Gd4jyGfwujoBAjmjzLZBzgkm4T1KmfHP0MQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARXef6Myb_Gd4jyGfwujoBAjmjzLZBzgkm4T1KmfHP0MQ@mail.gmail.com>


* Masahiro Yamada <masahiroy@kernel.org> wrote:

>       kbuild: simplify dtbs_install by reading the list of compiled DTBs
>       kbuild: deb-pkg: show verbose log for direct package builds
>       kbuild: deb-pkg: make debian/rules quiet for 'make deb-pkg'
>       kbuild: deb-pkg: build binary-arch in parallel
>       kbuild: deb-pkg: call more misc debhelper commands
>       kbuild: rpm-pkg: do not include depmod-generated files
>       kbuild: rpm-pkg: mark installed files in /boot as %ghost

Not sure whether it's related to these commits, but the kernel package 
build on Ubuntu is broken currently - both the deb-pkg and bindeb-pkg 
targets result in this build failure:

 $ make -j32 deb-pkg
 ...

   BTF [M] net/qrtr/qrtr-mhi.ko
   BTF [M] net/qrtr/qrtr-tun.ko
   BTF [M] net/batman-adv/batman-adv.ko
   BTF [M] net/sctp/sctp.ko
   BTF [M] net/mac80211/mac80211.ko
 file
 : No such file or directory
 make[3]: *** [debian/rules:61: binary-image] Error 255
 dpkg-buildpackage: error: make -f debian/rules binary subprocess returned exit status 2
 make[2]: *** [scripts/Makefile.package:121: deb-pkg] Error 2
 make[1]: *** [/home/mingo/tip.localinstall/Makefile:1541: deb-pkg] Error 2
 make: *** [Makefile:240: __sub-make] Error 2

Notes:

- Yes, those weird 'file' and ': No such file or directory' strings are 
  pasted as-is. No idea what it's about, and the build log doesn't say.

- The .config is an unremarkable .config derived from Ubuntu's own kernel 
  config - can send it separately to you if it matters.

- Software version is Ununtu 23.10 with the latest updates. Can send 
  details if it matters. Is there an easy Make command to run to extract 
  the software versions you'd need, instead of having to manually extract 
  it from a zillion tools and packages? 'make build-environment' or so?

- The kernel package build is also incredibly slow, as reported by others 
  back in January AFAICS, which makes bisection impractical. There's no 
  other build failure visible in the build log.

  I did one strace of the build (which is even more incredibly slow, takes 
  about an hour literally on a 4GHz box with 64 CPUs), which has shown this 
  weird instance shortly before the failure:

      3027593 newfstatat(AT_FDCWD, "deb-pkg", 0x7ffeef9f9960, 0) = -1 ENOENT  (No such file or directory)

  ... which might or might not be normal Make behavior.

Thanks,

	Ingo

