Return-Path: <linux-kbuild+bounces-2023-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9E58FF7FF
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 01:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08FC11F220D8
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 23:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C0213D884;
	Thu,  6 Jun 2024 23:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6onHeZP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864EF13DBBE
	for <linux-kbuild@vger.kernel.org>; Thu,  6 Jun 2024 23:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717715670; cv=none; b=FaDxTtVSQw5yIG5Ve4KLQ2k80J+qM3Y3QVwOfhFJbkwrk56NWUPpDiX9JsgPCMsCx47zKp8PIazrZDdk7SclP9H0pZrlSnD7vNBLRwZ3l8sQbmwHZaAkLypouojURVQfsMFvqTocBKpeopJnZOTV3pPomrzdkI/TY9kPI00pflY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717715670; c=relaxed/simple;
	bh=TdTCk7NUmEgaI6oaR5Hk4efJZTlMpfdD8dJv2g1Tvl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bSdar52KbsqlCUIc7EerO5pPkjmCvo480OPxmTQPTu19aYV+IY/h5U/weS5cnU6uz7tXzIAsOKJyfxsq8/XPdX5RIRLA+noJcpUeg/4PDhvfizoIajgdXSIHnIgsF9VQ1k645Tdj0mQAY89d9wKyaj6om6tqGKxs/EQh/jxecVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6onHeZP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-35dcff36522so1461525f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Jun 2024 16:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717715668; x=1718320468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsuE+4Ipqyv9NRs99R0VVNOCuZgkFSFxIJ5VENeNS1s=;
        b=d6onHeZP5nWoMDFUluKJWwNvbjgBq/+awncTgwPR7/vof3m45CabvPvb8bQ46FJYN2
         CH7EmafvCyXZjq4aJp8f8pAolCtDoFHEIxFuel5uBfr6ZywsH5EK/5NzkEM1dKxozQv7
         fPfCiYejz/8nkbRCg/qYdLeKRkZ0l5tWij2HK/57Gy9thx7r29aw6nduTb+pfJ4kXQAX
         3fbu8kgKWPlBVMCpo+t7z4TRTBaJro9YpuMz4Cgz53pENZLWrJw5NGvx2Gae9bVGAAIk
         Y+XJUxEI+0T8NDFf+Pbkac4DkiKTCCfXiViIU7cardDlIqxQt1KpeM69e1GFxUvvrZSI
         1Y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717715668; x=1718320468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsuE+4Ipqyv9NRs99R0VVNOCuZgkFSFxIJ5VENeNS1s=;
        b=cy+u2XNLruNIK5QUPD663Hj95MTxht+vpQ8oooZodV6WBLrNwhFq0SH4eKDam6ZhrF
         dMEX3qJOqypssR/IjkIl9lg8i1DsfPBlTH+guEw2tk0wEtS8a2wZ+0wr0iLFl4e2L1pX
         OgLSoORSogIJtu954qpM4UmXbuZHW6w/E2/VWTF86y1dd3LoythcXh5u/qStv8yqq+Y5
         S12/d4xuto7Mv4lD9RghJcGFEo7l9gFOhpL+cNmqZCMDMnBpBHz4rYJH/497hkmJjYZn
         kVNFXR5qouBU72J0Rj8IvJragL5rmbEr9c3ycQYubhzmhuhe5JL1x1h3a5Q3EWftN2G6
         iehg==
X-Forwarded-Encrypted: i=1; AJvYcCUGCVmvOaumfRYEtvSSuAOkePWzRzLmRrHq2dzCJsg9XEayUx/aqs5DLjwHGQi/q7WRhC36d8I8DBDSp5j19xRkAh47kirqKDWMfGJp
X-Gm-Message-State: AOJu0YwQXDaXsi0YpBDCro9gaCJzQiRNsAIvNgdS54Z1JqOykDOFKW5j
	4oQIAQDslCUIyxafGfkyvL1L5pwjDyRtdvPkeeLWYZ02Vybld6JNBqzCfKY9
X-Google-Smtp-Source: AGHT+IEIL4nQFx8w8yEpkPbWiWrT/h7YVydIrWf+YDJg5y7tRu504sHVkcKogJFtUREYdw3Iivn73w==
X-Received: by 2002:a05:6000:4592:b0:359:b737:51de with SMTP id ffacd0b85a97d-35efed093b5mr613264f8f.10.1717715667849;
        Thu, 06 Jun 2024 16:14:27 -0700 (PDT)
Received: from localhost.localdomain ([80.233.36.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d47debsm2632610f8f.27.2024.06.06.16.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 16:14:27 -0700 (PDT)
From: Dmitry Safonov <0x7f454c46@gmail.com>
To: mailingradian@gmail.com
Cc: kent.overstreet@linux.dev,
	linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	Dmitry Safonov <0x7f454c46@gmail.com>
Subject: [PATCH -next] kbuild: explicitly run mksysmap as sed script from link-vmlinux.sh
Date: Fri,  7 Jun 2024 00:14:21 +0100
Message-ID: <20240606231422.57599-1-0x7f454c46@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240605034903.373617-2-mailingradian@gmail.com>
References: <20240605034903.373617-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Jun 5, 2024 at 12:49 PM Richard Acayan <mailingradian@gmail.com> wrote:
>
> In commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed
> script"), the mksysmap script was transformed into a sed script,
> made directly executable with "#!/bin/sed -f". Apparently, the path to
> sed is different on NixOS, fixed by using the env command.
> 
> To accommodate the number of arguments above the normal maximum for
> hashbangs, the -S flag of env was used (as in
> "#!/usr/bin/env -S sed -f"). However, env -S is a GNU extension.
> Explicitly use sed instead of relying on the executable shebang to keep
> compatibility with build environments using Busybox.
> 
> Fixes: 973eca8db557 ("kbuild: mksysmap now works on nixos")
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Thanks! Fixes the build on my nix system as well.
Tested-by: Dmitry Safonov <0x7f454c46@gmail.com>

> ---
>  scripts/link-vmlinux.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 46ce5d04dbeb..518c70b8db50 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -193,7 +193,7 @@ kallsyms_step()
>  mksysmap()
>  {
>  	info NM ${2}
> -	${NM} -n "${1}" | "${srctree}/scripts/mksysmap" > "${2}"
> +	${NM} -n "${1}" | sed -f "${srctree}/scripts/mksysmap" > "${2}"
>  }
>  
>  sorttable()

