Return-Path: <linux-kbuild+bounces-5149-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CFE9F3178
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 14:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34BFD1888274
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 13:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74895205ACE;
	Mon, 16 Dec 2024 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EUpcv9Jh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545E9205AB0
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Dec 2024 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734355539; cv=none; b=jYVUCpnMqLriZEMLQsaDxRC0/NPs1g2jkswOITcD4l/ZIFbI0gnZveBclGMvWsInB20rb3pQwD6Gez0/XFaquw6QlgrUCbOLq6Le8FvObcjivdzpKu1EUjaP4lICSiWmPX8C/a5+w3GRoIv/q/S8WQcyIGwL3VlFCuKQfaxDKJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734355539; c=relaxed/simple;
	bh=NndeOH6sd65ORicRkF+Jky+H97Q2/FBkQEok6InkZT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ2spYz6mRepW8WzpF08VO5Oe9gS8D3vOgFTI8biaV+cuz1LGyqB6WQ0G8ygpnwbvBMaS1QXqOSrC5QpWENCl4ozl74okxA2oHV38FDZS3aoh9+RJwy78SbfXtVS5gZLc0+ObAeC5RI2BYcYpATBlWLfVEzwmO8ikg7B2R7LNuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EUpcv9Jh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e2880606so3769193f8f.3
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Dec 2024 05:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734355536; x=1734960336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STePF4alhOUCMJb60WwslpIUy0epmImIHj5n/B736B8=;
        b=EUpcv9JhDG+2+g4LGiJBH1hjfimm5Q0kzVNJbo3NAy1yLnwroXqbQ0NS/QZp5EYQVV
         /5ImGO+ypVik5s8CR5Vcas9g9zsw8KiGgkktNCkfbrVT30JlWJRm9JScQfidsojKDP6F
         LyqMVkm8eXmX87BJzpX5OFKwwtXff544hFQJS57sNf3lS6PQqdZwViSyNgKWRHDwq0ZR
         MLC0oapa2oLutHV2lmPGbmwHMklOpIvP2sXkAK1dLPzoPodLhxemY1HBI/g7W0KhqPCM
         HAJtOW1vcBxejpgdrTVniY212gDzGYMNv5gNiB1JYwHGtNVuSIMr1GVxc/Gvq8XdaJiP
         /rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734355536; x=1734960336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STePF4alhOUCMJb60WwslpIUy0epmImIHj5n/B736B8=;
        b=K41s6zaS7E/NLBG4h+DK0SA0N1jOss58jiXbZ+Ixql8nhA/sMtIG0s7YFb2NB5g2H5
         yc9FTgRdUuw3IyEbRs8W+OfiNfuWRMIw3cVHzMIOcDCEENRT7OgDtXGByyMiCs/KA5Uq
         H0ZXDQp6dBmAMsauXlIaY7yBKC03SgKfZc+uSUV2g+h6jUgJ+aD40WNIuTUCrQUH1j14
         6miFLYkgN31W4nG08uvnTZARmDAR/1hn7pSmqdI1nJIXAvXOfVPrdQ3SvWf7a+2dEu6R
         6S4Gi0D4g0vL3hVzEGreNIsgohQkNor/78vAzXvEYTxIpVptarPH06LQ4DKLV3CIESIl
         i4dA==
X-Forwarded-Encrypted: i=1; AJvYcCUGiVME/OSMlJUSEvWAghBDrdBv95TMFqCDJ7dT/A1c7JYLKy2knhlrdt1H2od7jplk4Zze1jXMGo50wPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyh9sDEGcJD0U6P2TjT6x/MGtITAzqcxWQT4SrAXtEc93MyUiE
	78zVtfLrlpCt6JCA2eMFjS9rQIl4JWddeVUAwN1DdiH1q3hla9JSb/CSBjYs/cc=
X-Gm-Gg: ASbGncva9CyU1vGWaIX9t4+h1zY7dG8ed56if0xb82GAsmdf7O1wLH8vSJVtkLojfUV
	ltOT+kMWOsgo1fVfBNtcfVbfe8JWPDjOq1erQMREsg+3KjXVmxmC7lxAJBXJaMC4VngO1o9lpgn
	F01W2LLkgPp5sdX4/INwvKUwOgOieDxzip9U04t3P84tRqWZj3V5fadEBHwnVDmLyS8PLRGjP+o
	dhEb5sNEyWJONnY8SSHplSrUX8emcq6R6iDhCv9+lQQmxteVo7oEREqBRzN
X-Google-Smtp-Source: AGHT+IGqoSYH/VA6fKloW87cFzqLGeD30iZmGbWZZas/HuP1gKITI6KUoUpWyXXkXirFAcpa9znGog==
X-Received: by 2002:adf:eec3:0:b0:388:c75d:be97 with SMTP id ffacd0b85a97d-388c75dbeaamr7310161f8f.11.1734355535593;
        Mon, 16 Dec 2024 05:25:35 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804a34fsm8253045f8f.76.2024.12.16.05.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 05:25:35 -0800 (PST)
Message-ID: <e522ec59-6ee6-4c11-8a4f-91a683e6435c@suse.com>
Date: Mon, 16 Dec 2024 14:25:33 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/5] Documentation/kbuild: Document storage of symbol
 information
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
 <20241123-extended-modversions-v10-4-0fa754ffdee3@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241123-extended-modversions-v10-4-0fa754ffdee3@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/23/24 03:42, Matthew Maurer wrote:
> Document where exported and imported symbols are kept, format options,
> and limitations.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  Documentation/kbuild/modules.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index 101de236cd0c9abe1f5684d80063ff3f9a7fc673..c32e3ed67cd26070f6929f6ad98c4308a1ab71f8 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -423,6 +423,26 @@ Symbols From the Kernel (vmlinux + modules)
>  	1) It lists all exported symbols from vmlinux and all modules.
>  	2) It lists the CRC if CONFIG_MODVERSIONS is enabled.
>  
> +Version Information Formats
> +---------------------------
> +
> +	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
> +	sections. Symbol names and namespaces are stored in __kstrtab and
> +	__kstrtabns respectively, using a format similar to the string table
> +	used for ELF. If CONFIG_MODVERSIONS is enabled, the CRCs corresponding
> +	to exported symbols will be added to the __kcrctab or __kcrctab_gpl.

The second sentence should be that symbol names and namespaces of
exported symbols are both stored in the __ksymtab_strings section.

> +
> +	If CONFIG_BASIC_MODVERSIONS is enabled (default with
> +	CONFIG_MODVERSIONS), imported symbols will have their symbol name and
> +	CRC stored in the __versions section of the importing module. This
> +	mode only supports symbols of length up to 64 bytes.
> +
> +	If CONFIG_EXTENDED_MODVERSIONS is enabled (required to enable both
> +	CONFIG_MODVERSIONS and CONFIG_RUST at the same time), imported symbols
> +	will have their symbol name recorded in the __version_ext_names
> +	section as a series of concatenated, null-terminated strings. CRCs for
> +	these symbols will be recorded in the __version_ext_crcs section.
> +
>  Symbols and External Modules
>  ----------------------------
>  
> 

-- 
Thanks,
Petr

