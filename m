Return-Path: <linux-kbuild+bounces-13182-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADUiJrrxCGq1AgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13182-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 00:37:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D7555E264
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 00:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B82FA30078DE
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 22:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CD238C427;
	Sat, 16 May 2026 22:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cynoR5E1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05E837F75B
	for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2026 22:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778971016; cv=none; b=tbUHU0GOo91ru02xbv9SDA/zTJ7DrtvfbPhix6fHZFgqS6emplK10eyvkxxTAGyzq8C9REXfHnwpoBkV7+22ilGTcLRZ/g86JGKZpkwxzo8CwO5KlffppTNQEcznLgzxNkcHDvCTrEk9gEfBF0m+UqMfENGwLKpMKMRofOZ/Nmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778971016; c=relaxed/simple;
	bh=sxq0Fouty+0v+eJA2xuYjtfpnte/cnVjXqImvrRUxIk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ecEeV8E/zwc9djvP8S1e3ZjSGJEL6aZKxSLEo3Iamh5tWsaKr/rwxxJOlNbgZ8EJNURNiuL2DEOtfzs5n9S+ddOZaOq9iRx8THgZ4Nz8sW4G82oeA/7sqLRfz8tyCqCciD/VQCmgS1vy03gM8WvjCf3viDv1dnl18SF7xojZlwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cynoR5E1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ad135063so6408435e9.0
        for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2026 15:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778971013; x=1779575813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sxq0Fouty+0v+eJA2xuYjtfpnte/cnVjXqImvrRUxIk=;
        b=cynoR5E1HeqYCTiD2FRyJb5ircrAUg8/6rvXhgnfMyjfXWo4dbLialEjE02DTbtx1n
         r3O7SqYLoPQAUe88qPo3vvHnhfjeNkw9VrfS6JQvfSf2TAeY3howQIpjtDyb3YzvqGue
         v0DskFIBDiY+17DRdIJ204ISEVIBFL8NRIGXD0v8Uc7Kb+jNgDbZ48LahfpikBJikGQ/
         RoryNL6veBZ8AnrSQp+EMPnn+ZI0ch87jajLgP2FEF8yIBYl5p4CFFiqiEyjFfF10dMb
         lzDupOH03C3dK/3V3TSnXK52QM/qaS8+uEZPaLFCl48h7V7vwJDBjG3d1VthwtkxjnpJ
         SSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778971013; x=1779575813;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxq0Fouty+0v+eJA2xuYjtfpnte/cnVjXqImvrRUxIk=;
        b=N/hHSKqdv6Yw5AAaZubYLg0ZKPPd5wUm8XBVqNGECIs0SM0bugdwB9ctb+enE2oL6+
         c8XtXUfxWa56yXvVpKH0JJ4WfRa901kgS+LAaoS7dIKOY7Hq+Fogz4Vi8MBhmKft/cxW
         lmQzlgV/yj0yqp4/59tFv8ErOpJS+3LzlREyV89Js15Wkq9PBBpOg1fDlwx9bK61riNq
         do7RCq5iEwws9lL+IN7K2VbBMjqn6yz1/DyN1u94ucSh9AmT8t3tJyWHj+8FyK5XFeyv
         OvPTKNrPZ55jV8Q/n2co5Cj6pnL6QCHAG3PCriCjNKL0v2roz8LFJOJbo/7Skx0RLVZX
         Lvew==
X-Forwarded-Encrypted: i=1; AFNElJ8AmuRO127k+mZgJ9s/uMz3rkpgUVK5HSCmEnmNsM772dd94vADoCQ7rOjKjq6WdRtSsBTkGt1FMUzQUuI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0THgfnuQzknD1rpeeFprcK4hVJGGEhScq/89pDWacAQZeeMXA
	Vhcj50kVl/oEyXAQhR4gJPLhmlz8bRtl9hpPVOUy8fZDIaG+mEBFaRxy
X-Gm-Gg: Acq92OHoLnNJnUOOaDWm+C0dfgiiZI/64XZ2762BJv/vTXcvKW0qnXGk1onhKE+Bg6F
	fqIWucf4o4tfZccq7Soh3p1MIARO1bj8KIMtCy2gacd6OcjWDbYqAjJwlJUQCksSn7+xJs6ieSW
	o673EV2+i3RpaOQPA1G/BvNZCiEw8QyRyTxT1PNlFYgCAY99sXTB1G9EIZ/JFX6cQxsdO7+0Wc5
	7EDbW6tdVpuqQ+1sKKG4grb+uCc8+WdCLo/mXccK+++f3I0QjlQWpbn3BQVgSjq9rTdyH5WEESR
	FSOGzYouw4Z8ZwGnnybaA+vGi1pzh2zAAdt8PqEU9PIGbVypQHNkh8svPhmYbEMTFv7yR8hYr8C
	KKXd8TNCAzClGRCjamMl04fpkqyKyOg2u9L0N1YDQD2FjyIQwewa46Cgh32pK46JTbAamhAN8mr
	Sl/aR6TT6TzwGoYIVXh5Je8UjtLxkQ2fKqqbB3FJ6jlvrJeUU7jGAx3i0=
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:c3f9 with SMTP id 5b1f17b1804b1-48fe661df4dmr122944235e9.31.1778971013009;
        Sat, 16 May 2026 15:36:53 -0700 (PDT)
Received: from [192.168.0.41] (bl21-200-180.dsl.telepac.pt. [2.82.200.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm25218839f8f.14.2026.05.16.15.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 15:36:52 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <2c9f467a-b303-4dc3-83ab-e2a857faec3c@gmail.com>
Date: Sat, 16 May 2026 23:36:50 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [RFC v3 0/3] add kconfirm
To: nathan@kernel.org, nsc@kernel.org
Cc: jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net,
 ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net,
 qingfang.deng@linux.dev, yann.prono@telecomnancy.net, demiobenour@gmail.com,
 ej@inai.de, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260516215354.449807-1-julianbraha@gmail.com>
Content-Language: en-US
In-Reply-To: <20260516215354.449807-1-julianbraha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F3D7555E264
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linux.intel.com,linux-foundation.org,garyguo.net,kernel.org,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,gmail.com,inai.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13182-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[crates.io:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/16/26 22:53, Julian Braha wrote:

> Dependencies will need to first be downloaded from crates.io by running
> the `cargo vendor` command in scripts/kconfirm/

Ugh, sorry all. I didn't realize that the linux gitignore blocks all dot
files.

So, the scripts/kconfirm/.cargo/config.toml wasn't checked in correctly
due to this.

It should have contained the following:
```
[source.crates-io]
replace-with = "vendored-sources"

[source.vendored-sources]
directory = "vendor"
```

And Nicolas, I think this was why v2 didn't compile for you.

- Julian Braha


