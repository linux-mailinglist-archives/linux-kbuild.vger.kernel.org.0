Return-Path: <linux-kbuild+bounces-10364-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 873C6CE9323
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 10:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96A133032A84
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 09:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF66D29A32D;
	Tue, 30 Dec 2025 09:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WEhTu2fs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5B3296BC3
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Dec 2025 09:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767086059; cv=none; b=pmtiAN55/MUhIT/69BfI7POvUlwKlldPWDnRuMalrYKVgecZYfuyVb8CmfRlVbknIwVXC8n9xxA6EHExNRZnoAkF7UqK2aAw2jz7EuinpL7TjOJ1ML1wDF+ByIfq8FHLhlfKUKMtuao6FWMmj1l96LzNGeHwdKjPZtYEyUjX9N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767086059; c=relaxed/simple;
	bh=kMYS4nDZW+xqFk8WFjUw9cG0U0R3IAGkPMZX0g8pS98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QNgoXVBgn2qSPJSWpEfUtDNc/XV6h3/i2BZ5n30BVD9wuEy7fqP0iB5XzjFpxjIp3zs0a3DPw7adti85qFNBXUwtG5tJ7EevlB4xfr33YjeaK0S1fZbvzgKDeUg3f/tNG1wbhhrvRC/QJw3zX7bthMkhQ5GIw/Zay6Ppze5u31k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=fail smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WEhTu2fs; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477563e28a3so59687745e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Dec 2025 01:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767086056; x=1767690856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6HQy+93eKiQBXRGPg3IyKK5TzImasqN2aR2WZLtqxk=;
        b=WEhTu2fsAIgu6DnvFwF/GqOKZev7dLH4f3Asap4bWY5kgFud9tUD6X2wRgjlo11UHR
         ZqCCaBuN32tspEn2MbyOB7rlRo2Ne6CBLNtJO3tQj7MXE5L7yg59M27VgVTUlPbfMz6j
         H9002fd3pMQ8PXnYGTxbQRhtdU7HxEkNbVw8qLAg4G6wUOEewU9H25xib/+H9nJmu7hm
         RgDSzyirjQcC/88ATOMrgtVY0ndCfceX/5lms+T7j4CVfAUGUY0fMqq/KcvKFkumGBrk
         ZzTqg8ISWUgLMG7amkFvnp89ccsCe27DvsF3MyBpdHFxWukC2inYngj8DuXOWRTiRjbr
         nlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767086056; x=1767690856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6HQy+93eKiQBXRGPg3IyKK5TzImasqN2aR2WZLtqxk=;
        b=V9Kx7eVQ3NCKb8XGT2WpkLCEFjZqsbKGGl7xXMxvnM1zxENQ70TwxeDbG2xOykSRln
         pH4QFgxK/8ml89oXEZ3VJKCKvV8ibtwRjmzCBDPqf4NVWFzuMg8Sdo6eZ/QiuZa04Xee
         Z/SFtlvpTwFNkm+hTT/FdqhGwt0wC5oZf+YCWm7CGs6UwVwE+j8BA78Rs/XX0iBQLRWY
         m/pcZxoAKYXqDe/t63rJMeXnkhkmUftaqUWAHegvkBqpzYkehY6pdZYay1PfXtD7rfNx
         b9hJV2Rk4UaNEHG/1eWHrrGiQB4nMR3RmkDdekwVcR3Rs6NDY9GRYDXXqULprPnSCtft
         DGow==
X-Forwarded-Encrypted: i=1; AJvYcCUzeNfbbl9ylJMGNjKSdzZ+nMrBIH9jdjlNWPMhHWxDY1crImC2TTbaUOC0K+tRR8DbjKL2WTMtlzScTTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8UK9te9Up9mSN1bkW55PeQJxb5qVWfzrpGm3KBmWtqP1XJMW5
	1zZ4RxAFaRT15IYGepfrYyzGTSHwNjkFzIv2dIezh7Hn+XMbDr1tWq/BXjTIeRGpsS0=
X-Gm-Gg: AY/fxX6Bx2DfY0Syrn3VvsO6rQNWpEib5Wv1p9hm75qqhqr0fUCqs1W8KlPZj+zCqwB
	8hV0XGS2F7Usv51Bu7p4tQGDEUm3orx3p57caM6ElsnTaT44MqUoDMU8wqC3nb/CyUsdMM3TyS6
	CObUBsF+Aa7bIIe1P7gX0PtaAv4qdXRP7f18swihARDxiY033gBRShyNBZsnR9zTDGIhI4Vwcrm
	yQc1pUrBlQajnVoJ4Tsr3VMtIj3rg29SlP/xPpH0ZW5AN16Rywioyf7ZGqN8zpHQVkWOH9BZ2WV
	wmgiDq9ml8oQVbeYdoZWl5ZGoU8WHfLA/o/0wEP8Q80uNtTyjO266G2HPGQZ/kuHXVl+EMt7h6R
	4C2iU4JWDllXts3ixWVX/b1Ru+I/SwT7+1lF3+PiWiTx8wESZDNEHf8pZouf1zFTsxgTzt5sjub
	/FHLlB6M9uVTA//NekKAkhGS7Y3Pq+LA==
X-Google-Smtp-Source: AGHT+IFKv3lNIvVVFE/AcEy5+lpmg1H1P5fZOOF4vDE/CodIsqYQs0HP6/eTBXDVP5Nqswfi6ttRjA==
X-Received: by 2002:a05:600c:8b82:b0:47b:deb9:163d with SMTP id 5b1f17b1804b1-47d18b99b99mr353825415e9.7.1767086056038;
        Tue, 30 Dec 2025 01:14:16 -0800 (PST)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a5486dsm254520345e9.9.2025.12.30.01.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 01:14:15 -0800 (PST)
Message-ID: <0d82084c-e633-40ff-b9fe-ce1532f28fdc@suse.com>
Date: Tue, 30 Dec 2025 10:14:13 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] module: Fix kernel panic when a symbol st_shndx is
 out of bounds
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20251224005752.201911-1-ihor.solodrai@linux.dev>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20251224005752.201911-1-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/24/25 1:57 AM, Ihor Solodrai wrote:
> [...]
> ---
>  kernel/module/main.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 710ee30b3bea..5bf456fad63e 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1568,6 +1568,13 @@ static int simplify_symbols(struct module *mod, const struct load_info *info)
>  			break;
>  
>  		default:
> +			if (sym[i].st_shndx >= info->hdr->e_shnum) {
> +				pr_err("%s: Symbol %s has an invalid section index %u (max %u)\n",
> +				       mod->name, name, sym[i].st_shndx, info->hdr->e_shnum - 1);
> +				ret = -ENOEXEC;
> +				break;
> +			}
> +
>  			/* Divert to percpu allocation if a percpu var. */
>  			if (sym[i].st_shndx == info->index.pcpu)
>  				secbase = (unsigned long)mod_percpu(mod);

The module loader should always at least get through the signature and
blacklist checks without crashing due to a corrupted ELF file. After
that point, the module content is to be trusted, but we try to error out
for most issues that would cause problems later on.

In this specific case, I think it is useful to add this check because
the code potentially crashes on a valid module that uses SHN_XINDEX. The
loader already rejects sh_link and sh_info values that are above e_shnum
in several places, so the patch is consistent with that behavior.

I suggest adding a proper commit description and sending a non-RFC
version.

-- 
Thanks,
Petr

