Return-Path: <linux-kbuild+bounces-13329-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPWqF2VsFWoBVAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13329-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 11:48:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C90945D3AC5
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 11:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 394D4300DD7D
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 09:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932C03D75DC;
	Tue, 26 May 2026 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EjQTkHLZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69923D890E
	for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2026 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788835; cv=none; b=aDojGRBgHUCZunZRWgoPs+7sQI0WjFIpLJiMTp1FZeIz6drZDRA+kExxiR6K2QAHFXvdJQ22X3N/CEblHXp8YJajNJ9HIPVm6aKD3mdR9HknSeX/gTevIzCYvBtZ3NwFiIT58+rqsL+Y5GCzzA93AhOYk6D1ux1QZ1+cgrjJ8Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788835; c=relaxed/simple;
	bh=8+nGGSKlUH2wqELDfgHiAT/VMPWJ2mHhPQF2ouWQF0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDosrStafxCl5+Qz0nlYKweKqxYXHYFAMb3Wz7uyHcFfCA4Xg84HpUEArrCCzX+kECzLmZUAlWaZWqucxkJ/L5SxC39cbxET8f7LZrHHJykShQ+iIda6u8187JRa9tuarysjP/wV5rR51Fgylhnouq8DsgoL5cZyElBzeSYX3wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EjQTkHLZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso88064395e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2026 02:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779788832; x=1780393632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R17d81rZFtdCmrvPdq6FOwdkUs8CSvLL3BM8+TQqKKA=;
        b=EjQTkHLZWZ8pVUg9gk59c/Y6msmKTq3bu4UiXtP0lNvzAnW1HzNIQOI+8h362r8uOz
         65J1roOpeed/GO/dcNRKF4mcOqiVwLlqNNBvo5kKdzC6J9wILMHJ9BvPhY9ry3PrsA4i
         n4rqddafwx34au/rxzpyxQdfV+/h8Wumnpkqoei2H9VUro489toB9gas7h1XDJkUk8CH
         O+9MN48NZdDBK0b+NhQ0p8I8EarJxSJgpWwmOXqd9qDajMs394MTLqyIaOkGFsYIRRjm
         3rP/59t6+CkpeqFn2g9Jsq3yp1J79p7PG+5nH+WBxj0dEoelXcyuvD+avrfoVM++dNME
         5pWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788832; x=1780393632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R17d81rZFtdCmrvPdq6FOwdkUs8CSvLL3BM8+TQqKKA=;
        b=shH3KvZGLtFPLY0q6/onbaQR34d9rfOJe20kBGQTVx5i94aK73VfeBZWo0E/tNb5Js
         OlDsZUC54Cag1pSas26pWnb0pZjrMKSvd3JfdAEIr5bUlU8gfPM0mpjuufvuizQWCFgS
         4ilZQH5GVJr7nFso+BF6TXJQduKnPOPei18KuWXFKhqMVuEZ/3alk5aqT3Xo+yvpB2cK
         95qpDsKQt/mlSA7L5Htl4MT4KTFQCmNl13/qKgF92Q92AT5UzKM0+wzq98A+guzFR5ct
         m29s0ulLIpXkqhX6GVOatnnuThUTnmqH3CrL+53DEBxmDQeO8Higa8vq551cidWsyK5h
         ExIw==
X-Forwarded-Encrypted: i=1; AFNElJ+5MmERRgRHnFiOW/Lb8H/kHWfSwlPv8HoY4H+4yiky4PfP7wpygUJu36vrgI1RRuyyAlTLOQpB2476Gsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSyYBjf6QBIpTNVlA5IXN4GTbYGP8Hd+gwCy4UrcWcuRSox7Nx
	BeWMgN/akwefJ2U7h7ONi99eFV0rtcgleB9glrOAthjxskwcP1WXgtTTh02PaD1v8Es=
X-Gm-Gg: Acq92OH58qBeDi3vW2L9UcnGhx5tW7R5P20YP6FfH1Vby1rke1UZC0tikp77Zf4GKQJ
	0Fw7XOZ1uPy3iFZRp7rpa/Mv+U97dhQocIBUT4UMThUL2xUW59L8QY3oFVhWAqxNJ0gzeSSFB9e
	HLYhgt00/Fz+eeM0XRlkRiMERCzUQktQUKTNSQ+pRt7vhSgPQkndqePfZvyqUKHnf29Zdpyg/78
	90Wv5BgSmz6aqaJdatJdxMRIDqsAVMegiJ3ELnj0FqbxoaEwc3DUBTp1Ss+mEguImuMmYQ41/50
	uk1f/aoagPb2EN3aR3iqB81hEEgXRS8LWsWcyD2UdTRnRVimv/G/9g+EWv/hoiZRrNMym6BbcUL
	aT/dPJF8Wh8bjyguLqd5Yth/LlQia8Kzkk9P17JwKPuoHT9VkX5HEbeF9BB4avzi+0U46k70EWE
	fIIUzIi/xnQfcH0171u4iFHTslnz+X3+6N7OgXTnSTUzqfHukTTZ+q9nmhYITYX3tDGARNEQ6kk
	KPlpuzaaqWv5OV72BR4xdgq/WZMHmlfu0VGJb0hRHbBcw4ASmLlxpN9et4Tra9fE8c4QFFH3VIa
	49TQ
X-Received: by 2002:a05:600c:6209:b0:490:601f:d776 with SMTP id 5b1f17b1804b1-490601fd9admr168561055e9.3.1779788832071;
        Tue, 26 May 2026 02:47:12 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm307921735e9.11.2026.05.26.02.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 02:47:11 -0700 (PDT)
Message-ID: <8de0e6ad-987a-4729-bbd0-8399968dbb48@suse.com>
Date: Tue, 26 May 2026 11:47:09 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/14] module: Switch load_info::len to size_t
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, Daniel Gomez
 <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
 Xiu Jianfeng <xiujianfeng@huawei.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?=
 <f.gruenbichler@proxmox.com>, Arnout Engelen <arnout@bzzt.net>,
 Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>,
 Christian Heusel <christian@heusel.eu>, =?UTF-8?Q?C=C3=A2ju_Mihai-Drosi?=
 <mcaju95@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org,
 debian-kernel@lists.debian.org
References: <20260505-module-hashes-v5-0-e174a5a49fce@weissschuh.net>
 <20260505-module-hashes-v5-6-e174a5a49fce@weissschuh.net>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260505-module-hashes-v5-6-e174a5a49fce@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,arndb.de,google.com,samsung.com,paul-moore.com,namei.org,hallyn.com,lwn.net,linux.ibm.com,ellerman.id.au,huawei.com,oracle.com,linux.dev,atomlin.com,oss.cyber.gouv.fr,vger.kernel.org,proxmox.com,bzzt.net,mapreri.org,archlinux.org,heusel.eu,linutronix.de,lists.ozlabs.org,lists.debian.org];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-13329-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[52];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: C90945D3AC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/5/26 11:05 AM, Thomas Weißschuh wrote:
> Switching the types will make some later changes cleaner.

Since the updated version drops the patch "module: Deduplicate signature
extraction", I believe this change is no longer necessary.

> size_t is also the semantically correct type for this field.
> 
> As both 'size_t' and 'unsigned long' are always the same size, this
> should be risk-free.

The module 'len' would now start in init_module() as 'unsigned long',
then change in copy_module_from_user() to size_t, and then back to
'unsigned long' when calling copy_chunked_from_user(). The current code
is more consistent and mostly uses 'unsigned long', matching the syscall
interface.

-- 
Thanks,
Petr

