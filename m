Return-Path: <linux-kbuild+bounces-10927-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFASDcpxe2mMEgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10927-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 15:42:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 433A9B1163
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 15:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 191BB3005161
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 14:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6E131355C;
	Thu, 29 Jan 2026 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DCdmfDvY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A94316904
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Jan 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769697709; cv=none; b=WL1oLahqOk7D7Hj/XzBQPCSq7xzT/BLZQApapUqy7XhUXOhqcKUcYR0SKIePV0QhnyiM1ugaZ3lPtVse2zrvSrfvST7Yvj+4/yqd0WD1wMnK8L7Bk2ULQBRjnsgqk4pIq6Yza2iylxUBAT7irZy/1D2a9XHCXR/d/sW0HiCjA/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769697709; c=relaxed/simple;
	bh=F0b8hnfWHbsOvhccuNKow2wnsDEWWek2mfssz8GMxsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLrS96cdAz2Jnx3JuLVVJ1kv2tykVa17383i42FABykbMvv9UuWdIEfaex4NVdmNbRHXFoadwZxhyeyAoeh/oiwTcYc9o3U8McRAoTwYHqnNxY5DwWYiz6v3QGac9UMzZehquCRLjoI61GTIqwRuFNKf3H7br0qDC7DUNLM2e/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DCdmfDvY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4805ef35864so8625065e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jan 2026 06:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769697706; x=1770302506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RiXqWFBbTqasdWh8G25vCefiMtu7P/aKonwdz1Q+QEk=;
        b=DCdmfDvYjNE7C1O2jiZtSAx5VFyXp7kD/Q7BI5euaOR+Aece3eGzUKs2VWuSK81cFV
         1GFRfcCRI5Gukv0bp9TizXNuyZfwsTpyqy5P+VkNyNxkRnws1AEIYl2hhEUd8UPa0/PW
         y+3TgGZgtrKtkyDwNhatNcP1EY9CAYjT70lD1b7Fs8UyFAO/WOJh+HnBMwFvQxOZlZBz
         QuNuFBwZImsqcYQ1MDZ/A8alCPRdprBiX4rjuvwJ24bIc5V0PHY1wJV1+QrbSDS7TFwP
         0REI1tXsfsQnH7ryQMfgAhS9va5/2Ax1ONsbMHGzdnpe132FZc+P1kz/N4aylIk7XgMh
         TwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769697706; x=1770302506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RiXqWFBbTqasdWh8G25vCefiMtu7P/aKonwdz1Q+QEk=;
        b=IcARmtaIoVqPd10zxgel+JJDldPNrW2c82PG4rXiqJNwCGo6/CAlormp/LPT8Q9dOM
         XUuGzw7IM0ihMqqf60J6fSixm1FZ06IINLFWF+6W2oteadTcvbNzUYORUb1WzbZcI1i0
         B60wf/Y7eOHrDBUhgUp2Ympx4cdAfqo0of6zPLmCMLniQPgZPHfJNvrw02eeZCgzd4Mt
         7XYHlYDH2l3GmT9EiENyO6BdoYJIcmCvsXGyinUr3Ko1x4GKHDU6J5ew+PyqMWCsZKIk
         Zqw3YgXHa1ZGx2+S0Gavr28oIVKBT71qUMIKEN+bf4S/F2hUsB9+sRIH9qx2fZVBxVx5
         4pKA==
X-Forwarded-Encrypted: i=1; AJvYcCVFnZHv4co93GUGaxskkTm6xYPmw6qkdeqdq6rEL4gXKGof59LBjXkBWh05vBbcLcWucHtpbULTtumM2Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbiu+ebwNLI2TiBi/6XOldKiFRPm2w3pazfSgl20htnD/S2y+y
	5mJGD8I/knmScTKAHn1HtbNpZw5rKW9MxSgFrCmntD8Imcg4Ubk4AW4L8cEFTYyY85w=
X-Gm-Gg: AZuq6aLBYKNg7jXlFCdQPu7v1MCuGe16pOmlIDXKGhZnQKqLmgI1AV2SH2iPD5TdrVL
	j5uC1g7MYsbnDdrsRhPdsIzeRQtqcEoaVd1RZzgELwetTV6ll7oW0LeXPOzkzhXiqBdkP1iq2/r
	CXnC3LKUCa+MoSV2Qby85A54Ub7Viy7WewmpuUpuY65bTGL0FBWjmR4Ra9k5zmSBytxxXbC6iwy
	AQye47F3E9nnAYuuHARf8HjjoIiSJopeyZgaR1UusGgn2uod+z+lbp5SHDerCCIA8NvFmX9ksW/
	pk2slzAm2qlDIQomHMQsPIXIRsEUjA8XEIdSvfuQzU/f8K6LIX3w9KP/JXyz+jQOCy3745sfFT5
	ZLDvTJOpiyHsB48t0ZVSrD+dN0oqr0JNpwrJ2g+4Dn989nsQHYSXP+qT+4HdUHlDX2OhIWDZ1RC
	zw9Kysm1RiX0MoKcvtY3NyQYWv3JOZUw==
X-Received: by 2002:a05:600c:8b76:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-48069c49d54mr120114805e9.24.1769697705735;
        Thu, 29 Jan 2026 06:41:45 -0800 (PST)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37433sm182396725e9.10.2026.01.29.06.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 06:41:45 -0800 (PST)
Message-ID: <aa92ce4a-d336-4d03-b87d-1c39b1c553da@suse.com>
Date: Thu, 29 Jan 2026 15:41:43 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/17] module: Move signature splitting up
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, Daniel Gomez
 <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
 Xiu Jianfeng <xiujianfeng@huawei.com>,
 =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>,
 Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>,
 kpcyrd <kpcyrd@archlinux.org>, Christian Heusel <christian@heusel.eu>,
 =?UTF-8?Q?C=C3=A2ju_Mihai-Drosi?= <mcaju95@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
 <20260113-module-hashes-v4-12-0b932db9b56b@weissschuh.net>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260113-module-hashes-v4-12-0b932db9b56b@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,google.com,samsung.com,paul-moore.com,namei.org,hallyn.com,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,huawei.com,oracle.com,linux.dev,atomlin.com,oss.cyber.gouv.fr,proxmox.com,bzzt.net,mapreri.org,archlinux.org,heusel.eu,linutronix.de,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-10927-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,weissschuh.net:email]
X-Rspamd-Queue-Id: 433A9B1163
X-Rspamd-Action: no action

On 1/13/26 1:28 PM, Thomas Weißschuh wrote:
> The signature splitting will also be used by CONFIG_MODULE_HASHES.
> 
> Move it up the callchain, so the result can be reused.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> [...]
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index c09b25c0166a..d65bc300a78c 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -3346,10 +3346,21 @@ static int early_mod_check(struct load_info *info, int flags)
>  
>  static int module_integrity_check(struct load_info *info, int flags)
>  {
> +	bool mangled_module = flags & (MODULE_INIT_IGNORE_MODVERSIONS |
> +				       MODULE_INIT_IGNORE_VERMAGIC);
> +	size_t sig_len;
> +	const u8 *sig;
>  	int err = 0;
>  
> +	if (IS_ENABLED(CONFIG_MODULE_SIG_POLICY)) {
> +		err = mod_split_sig(info->hdr, &info->len, mangled_module,
> +				    &sig_len, &sig, "module");
> +		if (err)
> +			return err;
> +	}
> +
>  	if (IS_ENABLED(CONFIG_MODULE_SIG))
> -		err = module_sig_check(info, flags);
> +		err = module_sig_check(info, sig, sig_len);
>  
>  	if (err)
>  		return err;

I suggest moving the IS_ENABLED(CONFIG_MODULE_SIG) block under the
new IS_ENABLED(CONFIG_MODULE_SIG_POLICY) section. I realize that
CONFIG_MODULE_SIG implies CONFIG_MODULE_SIG_POLICY, but I believe this
change makes it more apparent that this it the case. Otherwise, one
might for example wonder if sig_len in the module_sig_check() call can
be undefined.

	if (IS_ENABLED(CONFIG_MODULE_SIG_POLICY)) {
		err = mod_split_sig(info->hdr, &info->len, mangled_module,
				    &sig_len, &sig, "module");
		if (err)
			return err;

		if (IS_ENABLED(CONFIG_MODULE_SIG))
			err = module_sig_check(info, sig, sig_len);
	}

-- 
Thanks,
Petr

