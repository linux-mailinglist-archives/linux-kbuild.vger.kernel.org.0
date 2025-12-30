Return-Path: <linux-kbuild+bounces-10371-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8268BCEA3CF
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 17:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DAF34300485B
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 16:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16931328635;
	Tue, 30 Dec 2025 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mObP838C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CD8327C05
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Dec 2025 16:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767113952; cv=none; b=BCUhfj8Upe68OuPlR8cyoCuc24i5W20u04J5Wp8mPn7s8rxwDtSnSM3q5DmBsZNtoouzxS/TtRcTHWva55Y5zgdEf9/P2r3sjr8Kds1cAVymKR48suGihhJt+YtF/woMjZpumh90GUVHtYpDDq2mqZ3jCfKcU1G7OTlG9LOHpA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767113952; c=relaxed/simple;
	bh=dDbdKs/reOX/Ro2QQ4y9yDKHfgrv3HPQ+5tuYEjKOfs=;
	h=From:Message-ID:Date:MIME-Version:To:Cc:References:Subject:
	 In-Reply-To:Content-Type; b=t/6mjBxd3vjf8YXg9jwDhO5pdticuicotNyDTQfc1uemaHSk5n3pebbfqHGKgAukQpw+/g54rzUljfimFzGYOxV2HfW8bzXZNpjuUZsHS0BGvoRf3771R0GyDtldJnEtIPv5pjFKR5tqYvw6DKhRrYpa6BQbMnsIHQ+aNsH6tMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mObP838C; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6442e2dd8bbso6998219d50.0
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Dec 2025 08:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767113949; x=1767718749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRDjCthMH/qjCzj5SkNL4SRuuhJchcrlyUpx/5Dmle8=;
        b=mObP838COeOIAJUbmTPK9sw7/T4Ndssv8TsfvBW4HYyw6+dYL9Lu0pLsRfHWXC51jQ
         BTpL+u4VgJHhT+mc6lECd/G1WtTV0WCh92LaK8TOPE+3CH2yOQUp/G8uTEL5GWRudQjA
         ffKFje0GDhn1ua3bnmrdGnIsjrbJ3bzEqX/kC9rbCDdvaEp2r/bUd0zdoz3WVlU8lng7
         fkBvfBc/oBD7k4pvWcrl4wVZy3ZTSWFnjn4WxyCl15ndYZwskbonriRNmzI+YjZR2BYh
         GRyjo+R28f+cmVqEFgi2+mERaMEWPX9WzfrBvU7hC7eExtMWKi+3Fx3fyB22MnHGU3nc
         LCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767113949; x=1767718749;
        h=content-transfer-encoding:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRDjCthMH/qjCzj5SkNL4SRuuhJchcrlyUpx/5Dmle8=;
        b=ILixzJ0whfYKtiPICEfq4JKgddoGp8r5ub3jj4XjyXAKnjUmR046pFkJd1Gy2OsupF
         ZkmkDkH89P3TqJ9dsI91tw7CP/TGSNMxdbxfqTw6eO5pQ2+ckQ4Qa/DziN6QNyADSreM
         KXVdeHzAB2Fm/OWznoDTFE09wqmdn2M5wIs/q4YKuWC/hVssOzIByCGOV8FfJYCTwTfH
         vUjxn43pkbVvbPLYRdCU3O0G8LQxqOcL7dC3OifVTUeH/0XMeQ+H/IQOHSORj540Ldgu
         HK5BENRBAnrrzRZ/oaZ2QMvXegxbVycFcl+nRvYAIXZ8SSj/hJGFSoeL/3EShhKSfR4n
         1fig==
X-Forwarded-Encrypted: i=1; AJvYcCV+7/P6UueAxpfQjNbLAnvfUdagVa1e4Q0tIUM1sPvuydzqSolLukbope913RX1PPsRC94nwr7rgptKmG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCBuErLrF7DkhQ89jZmKN12EAzAXzroD2pilWA+yhjdZX1fISz
	6dxYc5c19SYCjbV1gkNS/FQk9cKErpohCT+yScmQaJlgm/4VZ882cFEa
X-Gm-Gg: AY/fxX74GE7tAJ6u2XJEWTLropWZGrHOutKxz6MzX14q2s+uwaKsXx6O/G2BPrIFHgk
	TjV7/wOKQfEFXV7YMFc3kRBxCCx7pTTyAbG5YGar8YwfvdW1zOZLX7T54piPDhJRpLyjK2zsgcx
	w6M9XjUzruLJ2m0UW7grna91eYRD6Uhn8y7eo1qLtqdj5ux8lKvtRu2+8JD8bk1lPtHyKg1SCFF
	1k760A1UVD6/dQaAaA548bcwqoRv2k8V5hli+4Zg4m3Y8rKjW54b8sUERjBidWEIvUurOpZRKIU
	hQlV66IzfA9jHxTai6hYODAVwEC3Z9cau68Msvvv5rsky0PnvoJwA0CHv5+QfVzD7XEvtM1CwQW
	89yBI84zFrNTBhCkoudfuiolcTiBPGcM8KH4qXPboa47MsQo7Idy2evibo1ZjXc+yUN9YNBcevF
	7sopxfGSUNUSQmzqtiMgrdkjo8PwZ4HSDVmVHw1thB
X-Google-Smtp-Source: AGHT+IH2V57ZyrIGYmhMfY0baEpBO+dBiOAau3e5WvXJCMGvc5QlBIWU/5RRYx65BeBxQ6CEQap2dA==
X-Received: by 2002:a05:690e:12c9:b0:636:149a:f54e with SMTP id 956f58d0204a3-6466a8a5c84mr29092072d50.37.1767113948961;
        Tue, 30 Dec 2025 08:59:08 -0800 (PST)
Received: from [192.168.1.209] (74.211.98.217.16clouds.com. [74.211.98.217])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a92d913sm16230434d50.20.2025.12.30.08.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 08:59:08 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <f462b3e9-0650-4d5f-ad60-96e8f1e39419@gmail.com>
Date: Wed, 31 Dec 2025 00:58:59 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xinrui.riscv@isrc.iscas.ac.cn
Cc: a.hindborg@kernel.org, alex@ghiti.fr, aliceryhl@google.com,
 aou@eecs.berkeley.edu, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 conor@kernel.org, corbet@lwn.net, dakr@kernel.org, gary@garyguo.net,
 jeffbai@aosc.io, jmontleo@redhat.com, justinstitt@google.com,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, lossin@kernel.org, morbo@google.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nsc@kernel.org,
 ojeda@kernel.org, palmer@dabbelt.com, pjw@kernel.org, rabenda.cn@gmail.com,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu, wangruikang@iscas.ac.cn
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
Subject: Re: [PATCH v6 0/4] RISC-V: re-enable gcc + rust builds
Content-Language: en-US
In-Reply-To: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I am replying using my previous personal email address to cross-verify 
that <xinrui.riscv@isrc.iscas.ac.cn> is indeed my own.

