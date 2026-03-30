Return-Path: <linux-kbuild+bounces-12369-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LPTKZzmymloBAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12369-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 23:09:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFA2361480
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 23:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67145300EFA2
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 21:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F0F39D6C5;
	Mon, 30 Mar 2026 21:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyPd92f7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F54A3A0B2E
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774904958; cv=none; b=WT+v0qb//SJAYQop9HFBZOhas+TOhUjuN859SV6n+zrupSHfCvrmy6fhWlk/kpsGzOWTi/sh+LN94ZZY+zuuuL9IFPXKTNWTMRkIIEjlZ8w0QgUf/RQIbG5nh9O02DbsAqSGHiatWxnVGmYjmBJQD/tBBKtd2Hn1Y6lhqEBDOTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774904958; c=relaxed/simple;
	bh=IMhQOsjCudR6+sxrPIeCmFwxdNjsHtb9hubGsjZ+tdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGmKRXoeBMVwBLY9qOzwCMtAkokYGmmk7nKBm9j+bI1bBsR1Rnucg9EJTQZM+iuS8XEJ7Hc10Lr4ornQE/uX1Zm7EWWISBDHEQw9xU95Yo5PvTtYfsGsWC9ItFkJ0C0Ro3HBgGqdCRJMDEsN8P6twjVopbPP1kyt0t8g76EpDXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyPd92f7; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56cde757d3dso1662587e0c.2
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 14:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774904956; x=1775509756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zlsVcWSeeIpbPnsSYMwOt0k3yfDPRs+s8ihr0jHypXY=;
        b=cyPd92f72mVkOHnyJOupvn/nr+MHOXYDyT9jm+BMbOfAneyNkjZB7exQZ4o/6LJgTw
         Rq4a8+M+wagQspoja3Uf2WIhSOzAKOAYxIl6j4dEOqELrCEukKZRj/QAyKkGmz25UiF0
         dbJKPhh1boJqbJ1vnheKV5wYLhq+pWumN7gOKRfRBf2E3RBMphTa5xugNPI+D1ymIqSF
         JyJKeD71EbVJjgcUITF2/efjogftzTfrTmozr8sy5iFYDm/nIPhj/OCv5nQ7u+eNXyR7
         p8z+tXR9ZvPWR+d1ptYWzfrY0A7qlX4hrkccXSMASq2YLJU7Ctlug8cfXBxXkWzgw15g
         CL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774904956; x=1775509756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlsVcWSeeIpbPnsSYMwOt0k3yfDPRs+s8ihr0jHypXY=;
        b=oZIytBw6045Bf7nedZZBbG1YWC8tXWDvxQITCYIMYS/7cTO2c/fKR4Ju8IkC+vMJ0n
         A/QqYwoveRduRBjuYwrra2pQ2+MnmHi63W4uloJol3uL4ZQrOrNtFNRxxiKkX8DeFUBf
         /t3fA/kRhGcSrNhuuNVIW09zh001W1KXglyUD80WEePE/gXOSkhgE/bxP4sOklWqa8oI
         XWXfrQm+ZIxIQum2M8ZKcBKnRAX9mWS2B27GgdPN+gdNfIYJujDyCVHootFVyLBs+N7N
         rOSqejVJcHcculZkzJtBYAmpp+e7JTM401iR8LctTD2Y0oLGLhmfpaSTfkLAdZZenQnX
         yUEg==
X-Forwarded-Encrypted: i=1; AJvYcCX21Ae+87bRL84e1Psc0t5dPK8aeX4srLtFm2YFq66x99mrIuyYATlw0UvoLiI9kEzpMLG0S2jIpAlm47k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUvkCOxvz/2bTf9MBVbXaASMu27BNdGnnLLIiMPVBnO2MUAfr8
	HZ8CzSbF+5QrSoPueSIuiTSC5UfgBrQ4Yl54Q40lRoeed8UsaUMwFniQ
X-Gm-Gg: ATEYQzwHKmC2V3+kxkv/ACVvD++RtJZcRfefit5+9YbNZfAQv8M3866bch1iyENkL/V
	ppfd7B/dZazDOl33wwnD0ykBMczjrk94PKg7UvSlOoNeLWXQh3pKb2QZO+3IehTVR8dmpo3ABbA
	lrfMsKi3IKH/s1h4MGWitKedIcsaXUZd0ELNTn9IvhcoDuIs5ocIWSg0ASFupUq5ny3+IvuHHQb
	TO3+JJxPfghtw2UJKKAPZ75op37bvOmGWNUPN7hZcLhtNjwE501u10uBJjCONDLNLgkaGencUMg
	Eq0wyZW4GMoyP4BgIysD6IJhT5d0NCbM/ZByGWAlnu5JBAaLVK7x/YlndegYAexmfGaPRT6g5ur
	721q5rtEtjZNOsHhoA5KlXLKXVjCq/jZHyhdpmCRs6Mo9EJGSTVR786V3LWlr8z7u7/Gk/ljZLV
	zE8dPE0uo8E2oqnKcOCYC6SecydFzESzOZnlDv
X-Received: by 2002:a05:6122:3c44:b0:56b:9ba4:1372 with SMTP id 71dfb90a1353d-56d4a5f8c0emr5672211e0c.9.1774904956234;
        Mon, 30 Mar 2026 14:09:16 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:d2a7::cebd? ([2001:871:22a:d2a7::cebd])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a333c9sm9989448e0c.13.2026.03.30.14.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 14:09:15 -0700 (PDT)
Message-ID: <f159850d-5fe6-4329-9703-b355305fd106@gmail.com>
Date: Mon, 30 Mar 2026 23:09:06 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Alice Ryhl <aliceryhl@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe
 <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>,
 a.hindborg@kernel.org, acourbot@nvidia.com, akpm@linux-foundation.org,
 anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net,
 johannes@sipsolutions.net, justinstitt@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org,
 mark.rutland@arm.com, mmaurer@google.com, morbo@google.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 nicolas.schier@linux.dev, nsc@kernel.org, peterz@infradead.org,
 richard@nod.at, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
 urezki@gmail.com
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
 <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <CANiq72=b+cr7Stxph_hXQTmD5crCvwWTqdaGKOJ7W1-66v4i_w@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72=b+cr7Stxph_hXQTmD5crCvwWTqdaGKOJ7W1-66v4i_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12369-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,armlinux.org.uk,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,google.com,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,linux.dev,infradead.org,nod.at,umich.edu];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chrisischrefl@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0BFA2361480
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 6:30 PM, Miguel Ojeda wrote:
> On Thu, Mar 26, 2026 at 4:18 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
>>
>> I'm not sure if this is still true, but I believe it used to be the case
>> that the -linux-gnueabi target has one behaviour for enums (fixed size)
>> whereas -none-eabi, the size of the type depends on the range of values
>> included in the enum.
>>
>> Certianly, when Arm Ltd were proposing EABI, EABI had the latter
>> behaviour, and I think there were cases where Linux used "enum" in
>> its UAPI.
> 
> Short enums? I see `c-enum-min-bits` in the armv7a-none-eabi built-in
> `rustc` target, and indeed:
> 
>     #![no_std]
> 
>     #[repr(C)]
>     enum T {
>         A,
>         B,
>     }
> 
>     pub static S: usize = core::mem::size_of::<T>();
> 
> is 1 for that one, and 4 for the other.

I guess we could use a custom target spec, but I'm not
sure if that is worth the hassle of adding another one.

Cheers,
Christian


