Return-Path: <linux-kbuild+bounces-7933-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6F9AFCB4A
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 15:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D404816D83B
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 13:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7752DC34C;
	Tue,  8 Jul 2025 13:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QXTJyVzd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AA826D4F7
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Jul 2025 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751979788; cv=none; b=kQd1pRzBUBY25u8FarIhJqSUqCXhO7CtwEUv7BLMnFbzgtY6VZzZHYorFc1fQwR4AW+ZAZONO+4P9ms0OYTrUOFCKDwmBYjJq7hWhQWJEG4io4XZ9S5oiTXcWK32nvgp9H0xZoHYlO+ugA/zRy5BJhXDdyXL8px13cepC2nM8eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751979788; c=relaxed/simple;
	bh=Y3ssvtVdT6GjWAm8mQjmaHBVjpYwMBCiiVf9vi3pxuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+H3RXqk2E79kU0IMJao+e1FKqapLLArypSUWqd8kpkeUudJF/YB42NIZVr+pBOwUqTS6cq4XR0sDdMQneY+8SzIXeedUfYzBoluRoJUoZHeNEn2STcg/8DOcg6Apoho5d0wrS8wVsEpTLuVKKGo7tJJfa/B4mMZrOe1sXbfQ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QXTJyVzd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so2704750f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Jul 2025 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751979784; x=1752584584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBNKDiLRChysupmqvHKYT2mfcl/4n2UVzs+2m0NT2FQ=;
        b=QXTJyVzdueIRU0o9g/i9oqv+5txIZIlJkNbHBbgkqmzy/thsWqAT3kwYEnLTrHM1oi
         D7V4x4KjWXmC8YUTfzCUZOfpruFp0y3SKADlUrcD9ymfZ/xz6NqQmmp14+SON2LpaZ9Q
         S7NEmfS4u6wVRBgo+IhsPrYbN67Czj6gfJLhFpW9i3s1rb0KdCGdEoMO1eLjNbXCAHOo
         GbIiipQVjtdpv+ysL72zUvD5UtsR5Rvyp4phzAgc+VX7Bg8UfuI9NyVxEpBWf4wuojWz
         H4PP4EMfFhHxXNLvFUGaoIIWmAB2AlTpcl+SOx4fRfC2d39zO1fvTrBaFvrAiM/I48uo
         EhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979784; x=1752584584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBNKDiLRChysupmqvHKYT2mfcl/4n2UVzs+2m0NT2FQ=;
        b=DaYrvIcg8rcHofFSrAIx0crWC7OPoRxkVsT4mtM8OOEEDeKSMVw0cCIotIYWxIYVJE
         nX2CcYVc0kYtr7TrDfZsWcVDH1d+0QSweqgig3b+OCXz+akCLnD7PdhY4/u6sGxIguyk
         Cd1+sF153/WPV1vgte9HiQnCBLvzuPGy4TrTVfGyTthJYzd1FHkEuVQLO8ctNwHzLth6
         86/1sdmCV761FxSOcUpQhXa8iJAqq7dzdx/CCLr8fIaMGqgLkGUDUtn6KH5TLAvl+7c0
         bfeceRnGaIMKuDk4VCg8UaBFjwWv7JXKooyUxLGopSXm3SYQyBDIE0DEWI98IOENBXoB
         YSfw==
X-Forwarded-Encrypted: i=1; AJvYcCXPgQe0qhRr1ILIX6fSFeWDytglOi5n20ewI6ZconaMsSc7H2nqOBWzHIQiJF8pJ8D2w/YO/KEIQirz34Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO7jnlpP1tTIieCp7OzU8A9BCRCnSaKGg1nZU1DJiPTM9XZYAJ
	z8V1kQndtw+PBSpW2sIJU2ecxP1ETY2ftQ5dbjUAwn1EmOfRNjw2suBTiVPSaTbBkgs=
X-Gm-Gg: ASbGnctlQc59a2HZviKFz1nT1kZoVIAs/wD1llJ0ljxg/UlHnRwWfXiOImAUxU1qIof
	hfl5T7khiEezw5huVKVwCcH5CcWGU+mcLwUlUsRUz8Ar873EM72ydqozZoWXSOdE8Zk+WbhB1YY
	RglA8Rd+D/0OSI4g6w7Vh1N6fYPDrAJDu6EBoiCyg6VENH3p7M4PDdGaBP2VgO5i0b8dw6Ruvme
	XRsb+o4cD1WrX7LV6M7DcqR5sTr4vIn01XCpXKVCLjOb4mmqji/Fox1z4D4qLHNNbXv0zO3Yxkw
	HBuqciJlT1miYQWv06jppU+RkJl7BtUkigCFNC8smGc86Y27mvSHBPgJNYNlXqp3oA==
X-Google-Smtp-Source: AGHT+IHMi4WXnVkZEVqB8NLtkDRu4v1G03GHPDZ2k6n5a8/P6IJD/eLFHdZsgcA96vMaGQOq9oe5XQ==
X-Received: by 2002:a05:6000:386:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3b4964ebe27mr14567959f8f.53.1751979783397;
        Tue, 08 Jul 2025 06:03:03 -0700 (PDT)
Received: from [10.100.51.209] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0941sm12821553f8f.26.2025.07.08.06.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:03:03 -0700 (PDT)
Message-ID: <20c5feae-25c0-4c8a-a40a-b35cece6c166@suse.com>
Date: Tue, 8 Jul 2025 15:03:01 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] module: Restrict module namespace access to in-tree
 modules
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Matthias Maennich <maennich@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Christoph Hellwig <hch@infradead.org>, Peter Zijlstra
 <peterz@infradead.org>, David Hildenbrand <david@redhat.com>,
 Shivank Garg <shivankg@amd.com>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20250708-export_modules-v1-0-fbf7a282d23f@suse.cz>
 <20250708-export_modules-v1-1-fbf7a282d23f@suse.cz>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250708-export_modules-v1-1-fbf7a282d23f@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/8/25 9:28 AM, Vlastimil Babka wrote:
> The module namespace support has been introduced to allow restricting
> exports to specific modules only, and intended for in-tree modules such
> as kvm. Make this intention explicit by disallowing out of tree modules
> both for the module loader and modpost.
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
> [...]
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 413ac6ea37021bc8ae260f624ca2745ed85333fc..ec7d8daa0347e3b65713396d6b6d14c2cb0270d3 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1157,7 +1157,8 @@ static int verify_namespace_is_imported(const struct load_info *info,
>  	namespace = kernel_symbol_namespace(sym);
>  	if (namespace && namespace[0]) {
>  
> -		if (verify_module_namespace(namespace, mod->name))
> +		if (get_modinfo(info, "intree") &&
> +		    verify_module_namespace(namespace, mod->name))
>  			return 0;
>  
>  		for_each_modinfo_entry(imported_namespace, info, "import_ns") {

I'd rather avoid another walk of the modinfo data in
verify_namespace_is_imported(). I suggest checking whether mod->taints
has TAINT_OOT_MODULE set instead, which should provide the same
information. The symbol resolution already relies on the taint flags, so
this is consistent with the rest of the code.

-- 
Thanks,
Petr

