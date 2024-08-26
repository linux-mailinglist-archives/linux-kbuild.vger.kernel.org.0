Return-Path: <linux-kbuild+bounces-3226-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EB795FB6C
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Aug 2024 23:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FFC42831E2
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Aug 2024 21:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5513A19AD93;
	Mon, 26 Aug 2024 21:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="V9a/VK0P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FFC19AA58
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Aug 2024 21:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724706884; cv=none; b=P6hnNpQhlKqds7Hv+GnfOS2ZcTGxmqvMsDoViA9qUBVr2ETzMXQEhCJZn1JAgRvxZA5aETYhcHJ8J9NwvdK0D7L7akd5NW9zR6OWHRkWF+r5IMTbCBoIYb7wH3V2R+Wc5PzOWpoa5jWzx0596gdPeGp05zI1DEB0YqOuJz4c0Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724706884; c=relaxed/simple;
	bh=JuLtfOwvgl3pJIhDThLbctL8y8rm4Fsrz4XE2hyJElo=;
	h=Date:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 From:To:Cc:Subject:References:In-Reply-To; b=Ur7t9UjTn6uYVUboVjpV1wwo8a/98p3BDQUaG8W1LDHshG3hzzM/9YG+gcFTdtFDIz4xypJrqWxAH/aIa+xYhipBlVXl2FZm5OnMztp/8sUPrAsvzralggF+5VVZnKEfPUIWEHuGCNvAfKoWrIkGf+hIHEv09M6gacvgJ7J91QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=V9a/VK0P; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a1dd2004e1so323102485a.3
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Aug 2024 14:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1724706881; x=1725311681; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C48ESkY/3prngSsdeTe5LzrMXXBR01WzruehC6SW7PU=;
        b=V9a/VK0PyahwbzmIMfG0KhG3uEz+yYrL/CXp2Zefkt/hKRr2IT0ufsfUOvjuWW9Nz7
         /QbLrL36F3Pjg3ZTt54pgLU1vU7OjsPpW7ORezbFuAZhovvyLAmwCWoZ17aCghsnWkVr
         iZr4hSrood+iEtQGSVP365+xVNaTmih+LI416IIslN5cbABrPlPV/xyO1G6e1R6k6uKc
         IrlptqEbwq6Lf3jZwb7GXegos62oovY1i4wgEo1db1R0Qx08vWcyo7uAaGITPG6ZRtek
         yTMpSe45sr38EihA4AIN1X3hPx2LmJMfbmSzd0bKLlH34PFVwbEg7OinixjNFcanSCTi
         aO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724706881; x=1725311681;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C48ESkY/3prngSsdeTe5LzrMXXBR01WzruehC6SW7PU=;
        b=fdeiWBMeL7YIrC49VqkGbUgTbyNO8mj9NxmlHxC6HUuZPotREbHIcNy2LOAq2pm34n
         ucJdm6ZUZ7ppm67QvsOy6lSTNwdyT/6LsXF2OZCCkkera9HC4pr4olEenlVAk7en8Pjs
         UhrCBNa1J2V4s5vuEvTVCjUfWp3vI2HMYxEsJQTCYjp0Jqdhfiurpc8oXUPwdGLx25W+
         maUKK/5Sqg4De0/MY5jEtCcsJraVROAR/oR7Lvw+rTs1XxiAMUYj10gso+DG/onIBpJW
         lz/BOAlE4FhrepiMdruU+84+2nTKy3RsNK/tBNr4MYOBQdmzWzwZCzbrmg/Fr5Vx6T55
         ujcw==
X-Gm-Message-State: AOJu0YyBuPxs+mFvpEA2tPGLbYDU6McUlF6L6vCEcWgR06FMYBaslLEA
	FbNcrhLAo4qWIQjx9yADhLfkHESVnx3Ha8P6aEx9t6r/5wPnn/Qf/ILgljiYWw==
X-Google-Smtp-Source: AGHT+IE1LxRd31YUhWAJ8z/HbxLsK9gCNJ4OLgZ+X7GsNtITcyo5P0zQWh0jVGZfAlqMnphQyvha8A==
X-Received: by 2002:a05:620a:28d4:b0:7a1:e250:52b9 with SMTP id af79cd13be357-7a7e4dfe12emr96769685a.30.1724706881248;
        Mon, 26 Aug 2024 14:14:41 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a67f3fca30sm492040285a.111.2024.08.26.14.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 14:14:40 -0700 (PDT)
Date: Mon, 26 Aug 2024 17:14:40 -0400
Message-ID: <317c7d20ab8a72975571cb554589522b@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-security-module@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, selinux@vger.kernel.org
Subject: Re: [PATCH 1/2] selinux: do not include <linux/*.h> headers from host  programs
References: <20240809122007.1220219-2-masahiroy@kernel.org>
In-Reply-To: <20240809122007.1220219-2-masahiroy@kernel.org>

On Aug  9, 2024 Masahiro Yamada <masahiroy@kernel.org> wrote:
> 
> Commit bfc5e3a6af39 ("selinux: use the kernel headers when building
> scripts/selinux") is not the right thing to do.
> 
> It is clear from the warning in include/uapi/linux/types.h:
> 
>   #ifndef __EXPORTED_HEADERS__
>   #warning "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders"
>   #endif /* __EXPORTED_HEADERS__ */
> 
> If you are inclined to define __EXPORTED_HEADERS__, you are likely doing
> wrong.
> 
> Adding the comment:
> 
>   /* NOTE: we really do want to use the kernel headers here */
> 
> does not justify the hack in any way.
> 
> Currently, <linux/*.h> headers are included for the following purposes:
> 
>  - <linux/capability.h> is included to check CAP_LAST_CAP
>  - <linux/socket.h> in included to check PF_MAX
> 
> We can skip these checks when building host programs, as they will
> be eventually tested when building the kernel space.
> 
> I got rid of <linux/stddef.h> from initial_sid_to_string.h because
> it is likely that NULL is already defined. If you insist on making
> it self-contained, you can add the following:
> 
>   #ifdef __KERNEL__
>   #include <linux/stddef.h>
>   #else
>   #include <stddef.h>
>   #endif
> 
> scripts/selinux/mdp/mdp.c still includes <linux/kconfig.h>, which is
> also discouraged and should be fixed by a follow-up refactoring.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  scripts/selinux/genheaders/Makefile           |  4 +---
>  scripts/selinux/genheaders/genheaders.c       |  3 ---
>  scripts/selinux/mdp/Makefile                  |  2 +-
>  scripts/selinux/mdp/mdp.c                     |  4 ----
>  security/selinux/include/classmap.h           | 19 ++++++++++++-------
>  .../selinux/include/initial_sid_to_string.h   |  2 --
>  6 files changed, 14 insertions(+), 20 deletions(-)

I'm not going to argue with the general idea behind this commit, but I
am going to complain about the writing style in that commit description,
it's not something I'm going to pull via the SELinux tree and I'm going
to object to it going in via any other tree.

Please rewrite the commit description to simply state the problem (e.g.
"we do not need to include the kernel headers when building the userspace
SELinux scripts") and the fix (e.g "we resolve this by making the kernel
specific portions protected by a __KERNEL__ macro check").  If you want
to preserve the snarky commentary you can do so in the cover letter.

> diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
> index 7229c9bf6c27..518209e1beb0 100644
> --- a/security/selinux/include/classmap.h
> +++ b/security/selinux/include/classmap.h
> @@ -1,8 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  
> -#include <linux/capability.h>
> -#include <linux/socket.h>
> -
>  #define COMMON_FILE_SOCK_PERMS                                            \
>  	"ioctl", "read", "write", "create", "getattr", "setattr", "lock", \
>  		"relabelfrom", "relabelto", "append", "map"
> @@ -36,10 +33,6 @@
>  	"mac_override", "mac_admin", "syslog", "wake_alarm", "block_suspend", \
>  		"audit_read", "perfmon", "bpf", "checkpoint_restore"
>  
> -#if CAP_LAST_CAP > CAP_CHECKPOINT_RESTORE
> -#error New capability defined, please update COMMON_CAP2_PERMS.
> -#endif
> -
>  /*
>   * Note: The name for any socket class should be suffixed by "socket",
>   *	 and doesn't contain more than one substr of "socket".
> @@ -181,6 +174,18 @@ const struct security_class_mapping secclass_map[] = {
>  	{ NULL }
>  };
>  
> +#ifdef __KERNEL__ /* avoid this check when building host programs */
> +
> +#include <linux/capability.h>
> +
> +#if CAP_LAST_CAP > CAP_CHECKPOINT_RESTORE
> +#error New capability defined, please update COMMON_CAP2_PERMS.
> +#endif
> +
> +#include <linux/socket.h>
> +
>  #if PF_MAX > 46
>  #error New address family defined, please update secclass_map.
>  #endif
> +
> +#endif /* __KERNEL__ */

Please keep both the CAP_LAST_CAP and PF_MAX checks where they are now,
closer to the affected code.

> diff --git a/security/selinux/include/initial_sid_to_string.h b/security/selinux/include/initial_sid_to_string.h
> index 99b353b2abb4..f683a78b21fd 100644
> --- a/security/selinux/include/initial_sid_to_string.h
> +++ b/security/selinux/include/initial_sid_to_string.h
> @@ -1,7 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  
> -#include <linux/stddef.h>

Yes, we don't need the kernel's stddef.h here, but I would like us to
have some type of stdddef.h included here so we have NULL defined.

>  static const char *const initial_sid_to_string[] = {
>  	NULL, /* zero placeholder, not used */
>  	"kernel", /* kernel / SECINITSID_KERNEL */
> -- 
> 2.43.0

--
paul-moore.com

