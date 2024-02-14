Return-Path: <linux-kbuild+bounces-932-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13016854B02
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Feb 2024 15:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 257FEB26F73
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Feb 2024 14:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7600D52F85;
	Wed, 14 Feb 2024 14:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZKjH/CTO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BF854BD2
	for <linux-kbuild@vger.kernel.org>; Wed, 14 Feb 2024 14:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707919333; cv=none; b=PK9jyT5YvhTiaub6+QopzwjZc3K+7JbI0NcK4OcdJYmHPD9ImPQGBnRYFJrw0UtBs78rfy3G5Hd6owynnNIY22VPgEgZI89Ppb65W84XVLFOfa3k0mqmGa1Sueb7flLzKeBgOFjP3E8GrHevNY/sOaysH7rjFud2ZOiwiacV2a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707919333; c=relaxed/simple;
	bh=QqFwvvlUJNF2o5O1ppQXW3Dj+VhrKqu/GQO8Sh+i5E8=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=pz9xM8d9lvjv2RH1oQYQnYsvyHtbHR0ZgsXZcJ69mNDgMGrMDppICl6TcryQQnsGZ6MH/jS73iGAVgukp6/JjzAPrMXjmNxFBf7doDbYBCFrVmeXK7DI8PQhYow5c+jdsn7TJGbch8B29Elwkpd5LKRFTCsMSpwbiasPeVRDJnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZKjH/CTO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3394bec856fso490038f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Feb 2024 06:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707919328; x=1708524128; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tccsGKyGVY+KWKzAziF3nNswbymLhoBDjzBTI9Ypqu0=;
        b=ZKjH/CTObKoOSu38mONwHDE9PyoJckBBPBTkWjY05OCO7dkIvTu2buagl8ZqZD6fKU
         mIp+co4oguJTDjX8IyJrXXKe0vfugpR16Nh/10yHivyiGv8yc8Wr1L4jAkM4npKXzzX6
         agnl4TEGfjBaKrRK54Eynbrmz+2Cp5q7nOijf2YmSwZAeunn5bBnxTq5sNo3X/lGuVo2
         ULNwThij2auHmGuru5bVN/NUCegq2kKTwPib5w0eJLGsXttl8z4TI4mGFX0IyW/34FsX
         7mQRWDcShSIH99ncpEecWkmWaWGa3bL/+UEyMuE3aqB+feoDs7SI9DN9slq1Ol8gfV7T
         7Frg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707919328; x=1708524128;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tccsGKyGVY+KWKzAziF3nNswbymLhoBDjzBTI9Ypqu0=;
        b=M1XV9WNvwAKdW752BdpENUigsVssxx0+MHQkUp/6gvFdr5voYCNSn5i+kvozFiYshJ
         cBGfn6aHT57mt+9l06X3NsJmFwNhEe5pahIMPGxRdooyUu5NH4XoWC/mtPnMR45xLM9n
         aBvkaVriOTCH9gOP6iEwFZfRZ6Qx+3Tt3JP5E4rbzTWevzQe3blTDl0nc5gA4sUisEVl
         cT2gDDx5nClKmrKMxPnDVAfFvDiX0k5MhPdKhCC7W/fEAMY/ztwDMcIKCUn9jCeEbkd6
         BBtllspbT/PBH1KtXh9/6UAA//mOGlmC1+4zpMnkpPPzJUepm67rltFqVsFTtpO2w3F3
         ZkPw==
X-Gm-Message-State: AOJu0YxYLaK6y/GCGZEnJop0MQo7cNwIIh3HjvOjf8lRWS1qJ/Qv+TNn
	JMVRUcutzUHGS8rfLChru8GK9CkWhgZKBcxWLaWgfHq4UH+oBEroVwyHujWJAFjizwUclnFCbJ9
	r
X-Google-Smtp-Source: AGHT+IHYir48UXoE2b1Sycckg7PNUhx+BIQOqEYzVP98h9DtQPqH8A+VAB2+kjQ/aAl8Co0xk1mdNg==
X-Received: by 2002:a5d:6610:0:b0:33c:ee72:3f7b with SMTP id n16-20020a5d6610000000b0033cee723f7bmr1527947wru.27.1707919328362;
        Wed, 14 Feb 2024 06:02:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIzY8vkAhNQy6Uoo/siG+RxXiGP2D1Ewg+b2PFnXZS34L/ZOH2UuXzIL0sqDXhycMee9hIpRJnRqejW7s+ZnG7Gzpfc2KZLVWED94Rp5A+uk8UlOkSHvlMfOCiqRZuZdcC0BDVgluauaFMRtbx1Si7RG0F4R8YH2AFp6Ut1CQ2eA==
Received: from ?IPv6:2804:30c:167a:ef00:fc7a:1b9f:b267:a6b6? ([2804:30c:167a:ef00:fc7a:1b9f:b267:a6b6])
        by smtp.gmail.com with ESMTPSA id dq22-20020a056a020f9600b005dca4c289c8sm336675pgb.34.2024.02.14.06.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 06:02:07 -0800 (PST)
Message-ID: <951fc31ee754ba86acaa9556e1d28c13075c66a2.camel@suse.com>
Subject: Out-of-tree module building fails with O= argument
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: linux-kbuild@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, Joe Lawrence
 <joe.lawrence@redhat.com>, Petr Mladek <pmladek@suse.com>, mbenes@suse.com,
  Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 14 Feb 2024 11:02:03 -0300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello Masahiro and Kbuild ML,

Recently we added out-of-tree module building on kselftests for the
livepatch selftests. Everything worked as expected, but kernel test
robot complained about it[1].

So far, all our tests were being done targeting different options for
kselftests, but we didn't test using the O=3D option. The interesting
part of it is that this can be easily reproducible with any out-of-tree
module building even on current upstream, like the code below:

$ uname -r
6.8.0-rc4+
$ make
make -C /lib/modules/6.8.0-rc4+/build M=3D/home/mpdesouza/test-oot
modules
make[1]: Entering directory '/home/mpdesouza/git/linux'
  CC [M]  /home/mpdesouza/test-oot/patch_1.o
  MODPOST /home/mpdesouza/test-oot/Module.symvers
  CC [M]  /home/mpdesouza/test-oot/patch_1.mod.o
  LD [M]  /home/mpdesouza/test-oot/patch_1.ko
  BTF [M] /home/mpdesouza/test-oot/patch_1.ko
make[1]: Leaving directory '/home/mpdesouza/git/linux'

But it fails when using O=3D argument:
$ make O=3D/tmp/kout
make -C /lib/modules/6.8.0-rc4+/build M=3D/home/mpdesouza/test-oot
modules
make[1]: Entering directory '/home/mpdesouza/git/linux'
make[2]: Entering directory '/tmp/kout'
/home/mpdesouza/git/linux/Makefile:733: include/config/auto.conf: No
such file or directory
make[2]: *** [/home/mpdesouza/git/linux/Makefile:240: __sub-make] Error
2
make[2]: Leaving directory '/tmp/kout'
make[1]: *** [Makefile:240: __sub-make] Error 2
make[1]: Leaving directory '/home/mpdesouza/git/linux'
make: *** [Makefile:6: all] Error 2

As I already described on [2], the O=3D argument (or KBUILD_OUTPUT) makes
the kernel to jump into the directory specified on the variabled, but
running the Makefile on /lib/modules/6.8.0-rc4+/build. The problem is
thattoplevel Makefile on /lib/modules/.../build includes files using
relative paths. In this case, the makefile tries to find
include/config/auto.conf on /tmp/kout, which obviously doesn't exists.

Do you think this can be a bug on Kbuild? Should we ignore O=3D when
building out-of-tree modules?

Also, as noted[3] by Petr Mladek (CCed here as well), kernel-devel
doesn't include auto.conf, so maybe kernel-devel should be patched as
well?

Thanks in advance,
  Marcos

[1]:
https://lore.kernel.org/oe-kbuild-all/202401300736.GkSZoSrA-lkp@intel.com/
[2]:
https://lore.kernel.org/oe-kbuild-all/fd027fa958a0bc65285a0c6c42e5921e7d28b=
0ad.camel@suse.com/
[3]: https://lore.kernel.org/oe-kbuild-all/ZbpnBqHUl3pE_3Te@alley/

