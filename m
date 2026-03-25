Return-Path: <linux-kbuild+bounces-12255-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON+DKIzgw2kgugQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12255-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 14:18:04 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AD1325912
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 14:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 82922300F2B6
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 12:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA6818C933;
	Wed, 25 Mar 2026 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QsQTBQ2R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD953D1717
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2026 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774442973; cv=none; b=gynvEjEtsflyRlvNB2tqZmM4A80cbzxQbDVIH3ndaSkhddIymBKE84ZYpNmxlvRrdXVLikO/f/b0xJOcBifIuL5DzKK5ZOxB8nCh/B/UHd4sVXI6dl3OoXp86xgsGPrB1k4K+8ZWPvj2bUbrKJq4y9l5+mVSjCQlZIlatBRGICw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774442973; c=relaxed/simple;
	bh=0jbWB3FjVQp+P8Ybiw1JdATIo1RfpVsEkcvfvEH0fIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdi9rQmP6okhycaXqcUbZH5UM6K9DS46djxiqaf120pdKnbaeHnCfj2OO90B+a+Na2UQ1e28fLpwEtsbDgJp/p+eEUvHAva/0MgzQj5SwwOtymEFwcFsLa0chVVQlQKAZi9gq9Sa25/KPL17QSjxymsBnbDiNA7HmNrSR7jSD44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QsQTBQ2R; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b6d9c981so609330f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2026 05:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774442970; x=1775047770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJ4RwDdYC7l5LX4+kxPiqchKwdT0zRAfuYVx8dHTGTI=;
        b=QsQTBQ2RkrQE7IMnUQFMVZf91MzfH5VhYOdj1f6Kc0qHkUjbpodcFhfNqvP7j00lIL
         7+0NS3ce2sJFLeV0zP1vFfjxIhzEfBOaUThEj56njyTJBz08hVYC3GsWPreyMX0/s+SI
         bqiSjb8e/MteSBDYDfZ88BtS+5N4oP3+lCjFDol0aDha2po5mM/macY7Gqc9+Qj7BF1Q
         Q9kC8G6jUxbYVPT/E3pXanzVD1QenpTOeoh5HahyBpCrlKLC34dPfa3dBGd4ozO0YZsi
         7nw+Vgi2bbhvnadrOePJ2jhdU86tkN+eJJiNDLdUr890bBTyvTbkDcI5FEOSvJZkri2v
         oHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774442970; x=1775047770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJ4RwDdYC7l5LX4+kxPiqchKwdT0zRAfuYVx8dHTGTI=;
        b=lupOzn18YBwFgm35bRsnZ+m2N0CX4lIyZOCHXLNFfF+PXGQ+uzYCHLgJRRA6cMJUrU
         T1+HmdVKGQQ83BOsvBfDsJFVK/43Rp4bh8m2SPEAAbuoUMiDUog5MqC5pvILja10wVpQ
         GtVRbRq05NGUe8HZaY9HfrmBAqiD+YfVOMRIVs3oqGOVfkMdpbY0ZhKINN/oWBKJ95XK
         oRE0OJ7PgbThXM3ChAtCDiDoEOdDt3TkGuADKbN5kYJThooZx6XvX23FCGWd0/cd+8i+
         i+BfCMG7rF/2V958C7e9YKPiikBvhsryLTNmNh9m2ubxx4ApdAYwPT/DkEmpZWcq4Z9E
         b4cA==
X-Forwarded-Encrypted: i=1; AJvYcCV41Y3O5fIJwgKQNPB2qWjDTSOhLwZDyi+9Z5KoaXcDfzNQFUnedueYfvfNGOKyxNhiPf9wAoRHyFtWE64=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR51Gl0B9ILqtwbMkNh4BDgeEj5CNISFtxByqU49kgf4IQVXvr
	7FfyK4ZRF17Wm5MRuhAlwDeu3G3ZgFMqZLlapyArnJRXyTrgb8rh1uP81xLF2UC4qlo=
X-Gm-Gg: ATEYQzz/LOZLSfw9Jq6VqL1AewJ2qF3mWRH+5mkGlVWBoIURO3llUlxAUdADo5FWtM5
	OFi95GWhd+zA4ji93Eo9mNdq4uqfvq8e6xutXxS3Jx07GVmiDafIlBYqyI7m1lNf713R2ACuTYb
	Un0nLsc6SQ/oNc877PswmRBYhFvDxvh9QBN29ZqMlgwctCYUlu2EZrURebAgdXESIXWrUh3IAbi
	2oQkWt3t05hyqg5pMNVhJR9QtwQH/f5ZSPInd9ed76Ha6uno/PeHu+RgAsD/kHLnjtsw9Ehmn0S
	b/dgtMXpecNgiXqhVTxM0oxb+6xcblSXjnspsY+8DnzpbvbNBh51RTsN6YN1q5ss6F5qePJLusY
	rou/oyGO73eTZ44YSHWWGb/c7PtEyFGntEiblcNzRJh16Ed0QUcoGqluJczTf4JC9Kul73PUZVa
	ZslOJ80ZR39RG8ETDbruPEKEPSL5M+MEpM9heVFTP7247D
X-Received: by 2002:a05:6000:228a:b0:43b:4909:203c with SMTP id ffacd0b85a97d-43b883c881dmr5791312f8f.21.1774442970332;
        Wed, 25 Mar 2026 05:49:30 -0700 (PDT)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8508285esm13445921f8f.19.2026.03.25.05.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 05:49:30 -0700 (PDT)
Message-ID: <b83c9524-13df-47dd-a597-bebab93288d8@suse.com>
Date: Wed, 25 Mar 2026 13:49:29 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] scalable symbol flags with __kflagstab
To: Siddharth Nayyar <sidnayyar@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 maennich@google.com, gprocida@google.com
References: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-12255-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: 99AD1325912
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/5/26 5:55 PM, Siddharth Nayyar wrote:
> This patch series implements a mechanism for scalable exported symbol
> flags using a separate section called __kflagstab. The series introduces
> __kflagstab support, removes *_gpl sections in favor of a GPL flag,
> simplifies symbol resolution during module loading.

I noticed that the series has a bisecting issue. The module loader
doesn't see any GPL-only exports after patch #4. I think you'll need to
squash patches #4 and #5 to fix this. Alternatively, the patches could
be swapped, with the caveat that GPL-only symbols would lose their GPL
property for one commit.

Nit: Please use simply the "module" prefix in commit subjects:

#1: module: define ksym_flags enumeration to represent kernel symbol flags
#2: module: add kflagstab section to vmlinux and modules
#4: module: use kflagstab instead of *_gpl sections
#6: module: deprecate usage of *_gpl sections
#7: module: remove *_gpl sections from vmlinux and modules

The changes look otherwise ok to me. With the above fixed, feel free to
add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

