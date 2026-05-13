Return-Path: <linux-kbuild+bounces-13134-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLsSC6yVBGoTLwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13134-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 17:15:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A85D535E4B
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 17:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 549013245AA3
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 14:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6893126B2;
	Wed, 13 May 2026 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSExdNpB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F05E269CE6
	for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2026 14:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681548; cv=none; b=THFO3+NHQGpXD3A378XYcke1Se982J35U2syaWapzHNtCTgeeCAkUU4Go0VYUMSMwukgLP3jDHSHtrmVDIp0DGeso+nm4xnJG/VP7UARIIfDCSW7z7oQ3L/FNmYRbsIv+bQws+Y91JaUFB5ECK0IGKh0k/bQwZ0+rJOarSlVAD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681548; c=relaxed/simple;
	bh=2GSMSTVsvoiuKafVkMeyFQjkSNsMir3nwpaEsBs4jsE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HAuD3me9owCUx+6GJKWUoKyi/BSa0g+5FK78xfRzoRbEiTPrstTRRqoAfTNY4K3WkEeAQRiLa4gibVkaYHqV3zGnud7Y93y0cJx/Z+PNog+7uFNF0MsvQkJwv5/RNTJ7ONPHfmxlV5Kn1fXFuI2dDaTpV9XOaqwpb5O8WvedYKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSExdNpB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so61153305e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2026 07:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778681544; x=1779286344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5AeU3RZqIRpK42nZO4mlXlJq7d3NeAbzn97432tCirg=;
        b=fSExdNpBKW4MsrXYeUeYrqIAusXAxrVytIqg89XIeWT4ZYIh8X6e7qKaR17cQXK79+
         jOyD7zrRLs6CnSEYaHzn68gM2sxJLqduqWTuvlfi9vOmwAWspvSb0HXpqwJDfIkVTom1
         00ySdCCnhezu8O40Zeo4D+840G1dEg4pL676MMOy32+NsWxlj0J41/uYv4VgSp7bFU6Z
         YVKI7LchjbGj8gAvC/OXRzXgDUlgSxQnwVYoMM1iWzQTL2o+c5hGbixFPyo3hzVLsBBa
         DrqiQT6Yap9OkY5KtjhcbHR7ab5KLi9bG0T5BIF4zOI6GmdesomsXfWiEzJY3ww/Yn1g
         kdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681544; x=1779286344;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AeU3RZqIRpK42nZO4mlXlJq7d3NeAbzn97432tCirg=;
        b=pr6Dq5cWAA2U1x77z/tzACcP1PRu9e3MJyJy6LM/Kq7gGqhTdhxTA1WXjRTf6TfSFz
         a0rjg2S+JMm5TTcwEpTuc8k3C61SvtyIozMy7ewWXCxhQSCuAj2RPuH13fh3qxB7TgCG
         Zy2j0hzz9PYy0EdFwt6IFNKgCfUCzeVz7UUPcBEjsQNXixtyV0ycr1Pq6BoULuC7KjXz
         Giu5hPGxiG8KxoZxd+se4BCnUDO7ANZTMnapnueKQTvE+YIh5VjzhMpT5jUJFsffwzcS
         o389iYPbJATVAz4pDi8i7B8IKGYLKQOE7mGqMlWbmzQvhF0qkP9J9hT9+QgDHr21gknb
         GGkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9p1cdzMhqoiks9J1rpNTwajMFOZlTG/CEhkNrhMbZPytkqFyvmaga9WK01alCv5YG9fEHYDqAx95gmeXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YycS8rlcypZxcHnssOW7uzUThC5QIEthPGVAlzDqI3Uyuem8ZIT
	IkBGHUBKkjVMcOn0+xh4YjrAgB9YfZeWXrY+jQ036oTtI/CfY263RSIf
X-Gm-Gg: Acq92OFPl2pzlcGGnl/QK8I+E/UVOGL1MUZ2A0crprN8JZMhQyG98Qw8m/9vmZ2chjj
	crjaJnfi5Dzzz/YnSy3eVonkDPqgmFU2pVIFuuxDEcOqX6Gzedd/hF1L0caqAe7w7Ak8JFZchRh
	kdmprMcBJqsFEK1oks65fIiq78kCPUVjWwzvzFVSFLVc3nAMx+N9zO8qO5eHvcoWf5QpcYDFr5Y
	YQcmfdqwGKzYyUzPDonuisCKvuLP8V522/KBDV5B2EGVKOKembmXh0T5g6DETTqELRFRpymXFZr
	9MUZE8L6f2oHlY3f9oUlkMO1cjFl2XywMfDdCtomHuHuN46+uAWqD3yW5SXIMrgeiLQwCtYyoeC
	MAVRlf1HvA4TjA7PIcT/I46CDY7nNbecH6KiJR5KbrSsqo9tmfxpQDYBGmbxWfIUkmDTAqQdEes
	ep2JfMcez0jSghFYDcGMGidJGeHfqHy9g8eaF6bptZrW/Tz6fbo+8RLSh6O4Y=
X-Received: by 2002:a05:600c:524d:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48fce9c0965mr46195725e9.8.1778681544302;
        Wed, 13 May 2026 07:12:24 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce37b18dsm52486725e9.11.2026.05.13.07.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:12:23 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <6aa2f745-aea2-4d10-9565-65e2722beba9@gmail.com>
Date: Wed, 13 May 2026 15:12:22 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 0/2] add kconfirm
From: Julian Braha <julianbraha@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Jan Engelhardt <ej@inai.de>
Cc: nathan@kernel.org, nsc@kernel.org, jani.nikula@linux.intel.com,
 akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org,
 corbet@lwn.net, qingfang.deng@linux.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr>
 <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
 <851ccd3c-d86a-409e-bd73-f0ef10b85879@gmail.com>
Content-Language: en-US
In-Reply-To: <851ccd3c-d86a-409e-bd73-f0ef10b85879@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8A85D535E4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13134-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,inai.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,crates.io:url]
X-Rspamd-Action: no action

On 5/11/26 00:06, Julian Braha wrote:
>> By the way, another option for that may be using the distribution's
>> registry (e.g. Debian and Fedora provide one through the package
>> manager).
> Unfortunately, it seems that there's no built-in way to fall back for
> other distros:
> https://github.com/rust-lang/cargo/issues/3066
> 
> The workaround could be to create various Cargo config.toml files, and
> instruct users that, for example, if they want to use the debian
> packages, they can download their dependencies using:
> `cargo vendor --config debian.toml`
> But I need to test this and confirm first since I don't use any of these
> distros.

As I started testing this approach with debian, I discovered that
the parser crate, nom-kconfig, isn't available in the debian registry. I
will bring this up with the developer of that library. However, it may
take some time to be packaged and made available to users, so I will
soon submit RFC v3 using crates.io for dependency download, but outside
of make, as previously discussed.

- Julian Braha

