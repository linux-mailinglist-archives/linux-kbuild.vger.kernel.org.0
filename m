Return-Path: <linux-kbuild+bounces-13390-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOXOCWx0GGoZkQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13390-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 18:59:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CEB5F5525
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 18:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E33613189B12
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 16:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E577C2580E1;
	Thu, 28 May 2026 16:14:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EF02E7393
	for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 16:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779984886; cv=none; b=B91zY3LdT7uXm7ylcUDposb0cHe3UxoyoP9qFWiCSI2ZYCKEj0ojn3Q8gIi89ech9WHVbRb25OzjcoJyzaN7S9pc3ylSq34/PjmNgZHyuHqRtG2zJPg+HXQhCHXJpYBGd1aKPEkuQVJIs6TL4b4aPSqfn5SQ2OZrZZAeo+81cgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779984886; c=relaxed/simple;
	bh=PHDLCXHLb6geoV+liXss4T/l8l490ju4aZ4ydPGildk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxB+Al78Bzjpc+ympW2799qW146cdtFOxvuGdmWmUcVR9IoBvZjMJp9Dniy+LvWOQHd4fjo+hnNtMMSCVJrb/RDX9p3fiReYJ+6wh+3R3OOhoZj7VFykwd25FPNwQKuunoBYwwDw0DYDMjxAcrmz7kjyo61yP5b1mjxlOk3Q+7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4906238c62eso43873385e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 09:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779984884; x=1780589684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfCiAYxwM6fSi2FMKc9LgQjerGAgaqnqOAwHUcR+LT8=;
        b=EHwSCFiEEB1puaoCRCa+ZPqCUSy1gVtNjHmlj6gCUCWkHUYk6bQIVrchWWH/2ZVZhR
         5/50qEYmr5rNxqKGZz7vIWyZ3gTv7XEQ3lM5DI+0G8+8Hju8KB7+Sdp9JJ6sNFlNsjki
         A4Huv4ePiOk1gdGQgCJ5XNT9/VOTEF7zGtlQdobjCnd1jdZmUCyVrqT8hLqBU5uwwvsf
         ZuDIh/tgWe1Pp74CXDQZiZrmADKXIyxuOknhvH+/fwYG/KRT9e3bRx7lUzXqLSxOnp0P
         kux9+13+FtIzvgqPKwjyisnLNQVU1oqUUArUaocdH+VmtXZUquxObc0K8d1uaN1F4uDG
         61/g==
X-Forwarded-Encrypted: i=1; AFNElJ/PSnTNcMkfIqyt7qn2I4MPPQ5bN+Mvhucce5tAu0dL2RAQ5ipmFPghs23b2oeQwWmZDcNptar9Nlz+1Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr2atQ/YSvv2NLuevBAqFd1KQKbCWZ5ApPqEg/WPYLvPPXIu8Y
	8CThlIpYbbeaQWjUsDvu3InyaiKDQPI8yCcQWAG/b+dJUJwQ+l62spqD
X-Gm-Gg: Acq92OGJY7WKtLlUPXx3MqHM2LYQifB+YwTkDWuKM8isPIvMyy/Fi2CIMi+5r4GhIwe
	mwRc6Iag00KhPfio5RphdwENr2RDqkr1UO3d+zSUv0Oh4hG7kBqtKRsx2qTVWqtdoGMfu+YCiO3
	+CXjOkuHMdaIrkwa6+bnKPWw7Hd9zhvayPpf9OcttesNdfntcmjKDInkzdziDAvOO7j7/ueF3Z1
	RCfRTYXpuyxKvlnrRFYKL5SK4/HWeUIh1W3Gt6i+2lYD88E3pX9C8JMSYbOZ1HVchZStAeWVWuA
	MdDCdQqOVa/Cs7q9yerV+iHJ0CH4TwQT53wL43WRf1fd2fL/r6c6A05JJKDIGPFRrPQs6Iekcu/
	xUeNFSsEXolsxXbWe5ye0kgOEu5Z9/ZVqgvZD/kO0rp5ZIxCe9mrLDgPvhgAEspZK/8li95asTr
	daginyEbDUk1jwjIza0Uw9BNgB1AwaTgwIlkct
X-Received: by 2002:a05:600c:c0d2:10b0:490:33b3:4be0 with SMTP id 5b1f17b1804b1-490426c1759mr350308945e9.20.1779984883857;
        Thu, 28 May 2026 09:14:43 -0700 (PDT)
Received: from gmail.com ([62.197.47.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909235d4c7sm45535105e9.3.2026.05.28.09.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 09:14:43 -0700 (PDT)
Date: Thu, 28 May 2026 17:14:42 +0100
From: Breno Leitao <leitao@debian.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, paulmck@kernel.org, Nicolas Schier <nsc@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	bpf@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/4] bootconfig: embed kernel.* cmdline at build time
Message-ID: <ahhpvNV91F6HUMeb@gmail.com>
References: <20260527-bootconfig_using_tools-v1-0-b6906a86e7d5@debian.org>
 <20260529001519.14ca9dbe92fb2622249137c6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529001519.14ca9dbe92fb2622249137c6@kernel.org>
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[debian.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13390-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 93CEB5F5525
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 12:15:19AM +0000, Masami Hiramatsu wrote:
> On Wed, 27 May 2026 09:41:33 -0700
> Breno Leitao <leitao@debian.org> wrote:
> 
> > The userspace pieces (xbc_snprint_cmdline() in lib/, tools/bootconfig -C)
> > already landed; this series wires the rendered cmdline into the kernel.
> > 
> > Motivation: today the embedded bootconfig is parsed at runtime, after
> > parse_early_param() has already run, so early_param() handlers can't
> > see embedded values. Folding the kernel.* subtree into the cmdline at
> > build time gives a CONFIG_CMDLINE-equivalent for embedded-bootconfig
> > users without forcing them to maintain two cmdline sources.
> > 
> > Behaviorally, the "kernel" subtree is rendered to a flat string at
> > build time and stashed in .init.rodata. setup_arch() prepends it to
> > boot_command_line before parse_early_param() runs. Overflow is a soft
> > error: the helper logs and leaves boot_command_line untouched rather
> > than panicking, so an oversized embedded bconf cannot brick a boot.
> > 
> 
> Thanks Breno, yes, that is what I think about.
> Let me check it. And could you also check Sashiko's comments?
> 
> https://sashiko.dev/#/patchset/20260527-bootconfig_using_tools-v1-0-b6906a86e7d5%40debian.org

Ack, I will have a look at them, thanks for confirming the direction is
correct.

--breno

