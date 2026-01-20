Return-Path: <linux-kbuild+bounces-10723-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AilK7gZcGkEVwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10723-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 01:11:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 244AC4E58F
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 01:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8465D72B5C3
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 12:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554234219E0;
	Tue, 20 Jan 2026 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="boq31eZl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306343E8C7D
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 12:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911473; cv=none; b=Jy5TlljXaDiyl+r4LEVycw5KNooDeol7Ua7BwBXyC35dMdbLkVLrO4cupQ1qayB4UJZYSWMWLl9sIw9EsKmkU/BwTMAre7R+/ZTmL/+XNdiI7FtcwULMIk4Oi2SlmqCZ60yO0zkUMIrIyLQApafxEXkrveo7IVKhXnWv+LtDbLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911473; c=relaxed/simple;
	bh=iIuzik8f3PuL5IiD05JYvutWRTw3mpzpbRggsiY4kB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQRygGD/xxguULNEVmzTO0+si1ctyv31elVadX5HBSm5Cx1ixq11VApVBEfNjLVzkn7UVNoXgRllByJo9eVMTedx/MOB4popDG3fH844L5xqzu/r8Gk5XTeqd1iMorCTkLWEkqiSZmejggWCf9AxJgtHSZjseLQP0d53VOcwhzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=boq31eZl; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-4359249bbacso233326f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 04:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768911469; x=1769516269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJRswF5rrqok4Sjk5jUvdiR7sS5VwezMU3Ml3c2KzVk=;
        b=boq31eZl0sUGywf9IH6qctlquE+MboocMi5kXOESrth2/RLFNyNekK9Yz2p1Dm4t9q
         pzPu50oo+ZQND3pYlw9dqv/dzBtad2jjkOxqOgH5zj9JdQbt4TzZMQ1CL+5Y93Ptb+la
         e68NZCwT7H95F6HnUMCIbzjTX4lYBvMufaKkpt95DH3x2a+wlmkPFq6H58XsYpvNyLRD
         0iudwmABr3Nnsdhy0fiTlKZQETK2XdxsXMpqi5nnrsk1w6Ug3pY8EG8Pk3MwB9OS2Aud
         +3stOyreBUDzcd7CQMyvNzeCsvA6aeAxsLN5gZFf3huV2+gCBGtMMGAOJy97nuT6HP2Z
         +toQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911469; x=1769516269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJRswF5rrqok4Sjk5jUvdiR7sS5VwezMU3Ml3c2KzVk=;
        b=gGANxmnDumrriJ5XScvK0GqgJfHGssTPnzpPcdAuJncO8dY3ZwGQAAyhXB7fXe+EKn
         vEGwx9vHl1d54ULZ9K96lLL6qecupv+r81Xemr2yxgYzxEZ9/fYABpUxi+p4pAhGZblO
         C3i4SEXcE7PVK62VBGgOfcWQ/9W0LvnVXmpkYS3otfTz+OUNiHJe/x76u5JOSr8Bs+JK
         36gVyQiLf+fFM3C//8KQLU95bBhaQiy1Z9Vs5bWMnQ5u2/HHgKOjoDmnwFncRMOPNENv
         xZqct4+BT1t8VC6e3k5LTeB6yanAmfCS272ma8QbYvGbm7vylVNAdNZ243u9woBK1D/o
         Uvqw==
X-Forwarded-Encrypted: i=1; AJvYcCVZGnJslKE037zfj2GLpra/YkzNgQMY+mhxs3b0ibOld0c+CVIB0B9SJO7/rP66VgWa4ueT37gcgMwjZXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqHCYcscNRyWM7PHssEUvULo1eQGyeJqDwZeDdF5uhDanVm03L
	JPknrRGjqhnkroE6HIx7xQI5YVssxXdbkV2DXvNCZC0ahiHKNqD5XLbX7w0puVXfUL8=
X-Gm-Gg: AZuq6aJMITB+em3604ePWm+2W5unhsGSwS8kVNvcyPmGhHhYp7yEyLjoKc7yGsMh4gJ
	UtKVZKu4jR15suHswrWVQS5DC6AYu/dPVBpq2EZsMAcX6HQxWKFmuyM3o4vEFI0FzufKqWMn+Ys
	eaAI7sFA1MydGF3eVQzEYnkBNsM2NA71O4uBAzlB4iAEP2nTiNjKcESwVpvuAmWxpLfJBZV7YfL
	kO75jna+OIgWfxMMXhycXCdPNtlaHYq2khtYPcj+VlrcmcVMNa56SIN/ZDoWWqlCJqdRZG9slBl
	2OGwtRGETNBFnXTngvIcyPmA/iU3PMIm0I3sMa19NqS4MpgXpORz8jCwaeryAP1dRowW5/GTt9f
	jtDNpFszgHzAhdR13qRBXWXbCqh6XDzMaWPqsRkKj/BRhQU4q34QvgT4jTk9HNlR9h57GoUBveR
	uWBRx6tMC51LC9VsEXL2j3p0JdkOmbMABsvL3qMV73
X-Received: by 2002:a05:6000:2387:b0:42f:b555:5275 with SMTP id ffacd0b85a97d-43569548aa2mr19948618f8f.10.1768911469374;
        Tue, 20 Jan 2026 04:17:49 -0800 (PST)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6dasm29657069f8f.32.2026.01.20.04.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 04:17:49 -0800 (PST)
Message-ID: <4d379736-9b6a-4e40-ad67-53ee7498759c@suse.com>
Date: Tue, 20 Jan 2026 13:17:48 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Documentation/kbuild: Document gendwarfksyms build
 dependencies
To: linjh22s@gmail.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Sami Tolvanen <samitolvanen@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260114-documents_gendwarfksyms-v2-0-297c98bd62c6@gmail.com>
 <20260114-documents_gendwarfksyms-v2-1-297c98bd62c6@gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260114-documents_gendwarfksyms-v2-1-297c98bd62c6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,gmail.com,google.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-10723-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,suse.com:email,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 244AC4E58F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/14/26 12:47 PM, Jihan LIN via B4 Relay wrote:
> From: Jihan LIN <linjh22s@gmail.com>
> 
> Although dependencies for gendwarfksyms were recently added to the
> packaging rules [1-2], the corresponding documentation was missing.
> 
> Document the required build dependencies for gendwarfksyms, and
> include a few examples for installing these dependencies on some
> distributions.
> 
> [1] commit 657f96cb7c06 ("kbuild: deb-pkg: Add libdw-dev:native to
> Build-Depends-Arch")
> [2] commit 5bd6bdd0f76e ("kbuild: rpm-pkg: Add (elfutils-devel or
> libdw-devel) to BuildRequires")
> Signed-off-by: Jihan LIN <linjh22s@gmail.com>
> ---
>  Documentation/kbuild/gendwarfksyms.rst | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbuild/gendwarfksyms.rst
> index ed366250a54eac3a72c2f529da94a9e803704ae4..0e153d13b052da6edcf65950739730c123cd49db 100644
> --- a/Documentation/kbuild/gendwarfksyms.rst
> +++ b/Documentation/kbuild/gendwarfksyms.rst
> @@ -14,6 +14,29 @@ selected, **gendwarfksyms** is used instead to calculate symbol versions
>  from the DWARF debugging information, which contains the necessary
>  details about the final module ABI.
>  
> +Dependencies
> +------------
> +
> +libelf, libdw and zlib are dependencies of gendwarfksyms.
> +
> +Here are a few examples for installing these dependencies:
> +
> +* Arch Linux and derivatives::
> +
> +	sudo pacman --needed -S zlib libelf
> +
> +* Debian, Ubuntu, and derivatives::
> +
> +	sudo apt install libelf-dev libdw-dev zlib1g-dev
> +
> +* Fedora and derivatives::
> +
> +	sudo dnf install elfutils-libelf-devel elfutils-devel zlib-devel
> +
> +* openSUSE and derivatives::
> +
> +	sudo zypper install libelf-devel libdw-devel zlib-devel
> +

Nit: I suggest slightly adjusting the text to something like:

"""
Gendwarfksyms depends on the libelf, libdw, and zlib libraries.

Here are a few examples of how to install these dependencies:
"""

.. and swap the items on the pacman line to 'libelf zlib' so the order
is always libelf, libdw, zlib.

Looks ok to me nonetheless, the list is consistent with similar examples
in Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

