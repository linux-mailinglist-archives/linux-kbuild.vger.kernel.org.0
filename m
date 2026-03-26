Return-Path: <linux-kbuild+bounces-12284-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHJUCPZFxWkB9AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12284-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 15:43:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2BC336F3F
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 15:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2684F318BEB0
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 14:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE623FD141;
	Thu, 26 Mar 2026 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCTj45Fs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E7A37C901
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535495; cv=none; b=tjCWe1pQaS/Y04MVYGsZSrPj2863kNiq4uYhan05fmPsOySi3W66ygFy7ISMz/yGTG1aEYBhyQVOLNJxLYknHd7rrP4rdop03lbe5zI46j3fHH2lXnmsndIsoBGvQWniztkF7NRbfxdssaKZGoqWcszfhrBv63DcVlBGE+J5l0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535495; c=relaxed/simple;
	bh=3Vzte3b1zLfQQJBgi5xEQ7PzA9z5e7EmHBF4s8am6qI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlUe8VOr8lUplwFkNNVguPZJL0OvOqEu5g4dK9eXIqBTN/rbzj86OpmkLgmsEeEikFhRZuysvjnZ+j1LkuULFyaqzJNMYZM3tCUweXSUkNj9WLhziz7C9OXdeEnf+g8pS0DEuvsN7MDcPGXR69MIRg7r1IAZYRvC8B4Sgy1DiZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCTj45Fs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so949559f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535492; x=1775140292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jv2EfhMbcWOA2sU2awQXAMiSQ1dwjbJBc3BzfW+6rZQ=;
        b=jCTj45Fsg1mt0evp6QQXTV6GZLmbeMqtXFXwPKuMUZbRRoQqQew70Fgx2NGx4f96nq
         rtW5SrDz4N6rRh+rXXok7lAKvu+Ip4QJSrGEk9BstwuR6goXQRh/Rxv6zdVtrKxK3AXR
         Z/BM4sTiIyVfXtl7t+CDrdK5bbz7exdE+AYEZIy9i6xTW9DsjY2HhOd/BSFdSMgjqoPi
         2azh6I2sQ4zKefYgckNEtTw6tIQQSc3QzjZI8Iy9aLVg9sJuKst8ad+joyBADw5Ffzm4
         jIRyJsT8FBNgjm6jj6GEwke7Zet0tGQnEtoxQYy3pmgjDjIDUBXJLYCSkPNPk+gcY7Sr
         g1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535492; x=1775140292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jv2EfhMbcWOA2sU2awQXAMiSQ1dwjbJBc3BzfW+6rZQ=;
        b=FQUKOFizD4LKCMUoc2WSK7yQr8OWm5JDhQjGD0WyJgPMrL0TGerLhWiO7vzz59XWat
         d4sDsNkU4FvBv2I+22GNkx7djrxAxHX9KQRnfNydDQ8pC/YVjGJH/wePpinR/ROYrtum
         xK4AuH9oCYKQqNFnphfQ0u3nLBmR4tYsn/0p8R8JNvjzK6WUQz7lywGHrJTnDa1Nvl+P
         IZIoW9eL/V4JQfwT/0nJ3LA+Ug96vp2ndEKOH316QALqAQ3K0z5FGSoaYf0ieNG/UJgd
         q5LnHA3lY/NK0un4zmmobUlTNb/lL6+N2LTS2vTAqpfe2np72jn5euU7Nq1SksZK4xwb
         nQcA==
X-Forwarded-Encrypted: i=1; AJvYcCUun8W5pdZTtTc8Uf24xE6YE/WYO9n05poA4kWmTFe845gYKdV++f7etOWX86id7sX1hvdS+RV80b7cx6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLVWBc2BsRAMtmoXwL27Rny8K2sGn5Atu3rfgAwMh/xRSQAWuY
	u6ML/VBw5u4wEYseZ5lhm5YgLxiT4nT77xK6VW8Tsf2OORO8ACELqn/X
X-Gm-Gg: ATEYQzweOES0jmDWSn4XsPMvJ9wbbmRDbpMzb2bFvWLheD8tu8/Xre0YtztgGU+DXhN
	ATOEY4jzeWm7YQcpNPJoeo4FVAL741TqIEBmoKac7owUYey9V2tQgdJY91fsw+Qnv9I1VL8VfZi
	cPAqJrcXAo7kAkNOZDmqaZGfMozUancib/nSisHDnQ2ATaSfThXHJzqMEu5ozwWUKSqBgHZDKEg
	xNUbImnh2W4p9+9rymBaWT1ksWPPJiKL35ZTFVvxsqTY/qo63BO7y0toy9eZHJu41VXHt5Pk8z2
	qJ34MJ0gXw0u+oMvr+W4Oj5GktL44iYa+en3D/eVjhBo1xD+ULMC4RKtitIT10MoarczMZcVh5A
	lN312HebxqZPcS6VBdHB9BIFe9fy04Vht+oXFNvfj/9UVFOEtZZIGAdTbkLO6fb2G5bP1u6a38r
	f1g39nZGU6g7qb0JyOeaVYJUfDemJM3/W66Z4h
X-Received: by 2002:a05:6000:4381:b0:43b:5672:f02 with SMTP id ffacd0b85a97d-43b88a21651mr11427910f8f.7.1774535491079;
        Thu, 26 Mar 2026 07:31:31 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:d2a7::cebd? ([2001:871:22a:d2a7::cebd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e528sm8063097f8f.1.2026.03.26.07.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:31:29 -0700 (PDT)
Message-ID: <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
Date: Thu, 26 Mar 2026 15:31:26 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com,
 akpm@linux-foundation.org, anton.ivanov@cambridgegreys.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 david@davidgow.net, gary@garyguo.net, johannes@sipsolutions.net,
 justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev,
 lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com,
 morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 nicolas.schier@linux.dev, nsc@kernel.org, peterz@infradead.org,
 richard@nod.at, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
 urezki@gmail.com
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12284-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,google.com,kernel.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[armlinux.org.uk,kernel.org,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,google.com,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chrisischrefl@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C2BC336F3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miguel,

On 3/26/26 2:47 PM, Miguel Ojeda wrote:
> On Thu, Mar 26, 2026 at 11:10 AM Alice Ryhl <aliceryhl@google.com> wrote:
>>
>> I noticed that the Makefile currently uses the arm-unknown-linux-gnueabi
>> target. It should probably not be -linux target to avoid this? Probably
>> it should just be armv7a-none-eabi, right? We gate HAVE_RUST on
>> CPU_32v7, so we should not need to consider the other variants.
> 
> I think Christian tried several targets back then and eventually
> picked that one.
> 
> Christian: what was the reason to pick the `-linux-` one? e.g. was
> there something you wanted to rely on that target spec that you
> couldn't enable or disable via `rustc` flags or similar?

It should probably be fine to use armv7a-none-eabi. I've mostly used
arm-unknown-linux-gnueabi since I though it needed to match the
bindgen-target (which is -linux-gnu for all architectures) and 
because from what I understand clang also uses arm-linux-gnueabi [1].
Also when I selected the target I thought that we would also support
armv6, but since I had no v6 hardware to test on I disabled it.
[1]: https://github.com/Rust-for-Linux/linux/blob/rust-next/scripts/Makefile.clang#L4

Cheers,
Christian

