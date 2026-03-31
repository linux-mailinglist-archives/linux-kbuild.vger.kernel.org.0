Return-Path: <linux-kbuild+bounces-12428-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDUAJ94MzGnGNgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12428-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:05:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BF136FAC7
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1DDF30595A5
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA3143E9C9;
	Tue, 31 Mar 2026 17:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btmB3XFt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF4E43E9DF
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 17:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979279; cv=pass; b=amSVsZdCtyx6UUkiZ5w4hhYgdIC4HMsYA6fVDakq14/MMS9XyFtxGNfpC5GAglyvhWC2nvdZsYFNTKr6vtSIi/NkoHLHr9QX0Sobwrbfpt3DpzrYQjdzdWWG0Immv5Q8tnN7SAY3xESiKqchUd/nQsZ3Qim3hHO9VVyJrDNkU9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979279; c=relaxed/simple;
	bh=0gsHE02IRJdRhrhJLMxNqQrK8YKfaYio1tL3SdU4Cww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZkZLR7QtdCbu/Z4iKTfnMQwTCBIchFPegF/6bUzv/EkoH8N/8gJQLXQ5C3f21ip5X/9Rtt8XF1iECzI568CPZQo3U6xUHlN8bsbz2g+eARypWpW1RUZRw4cJjjiB0CujE3Np3bvr4Ehg8y6e8UcbDCdkIZ9NzcIxvKJCtfhUPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btmB3XFt; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12a77005d69so424756c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774979277; cv=none;
        d=google.com; s=arc-20240605;
        b=hqNv1VDSvo4Kr1NHt2rhxeW2BGvvDSW7JF1i9u7qJzszV7hxmD/bOu9aYWcCv8LG7K
         2l4LckiyBITdWl4R4VphUNLJgeU2IlZ0HYZYff3JMWK8PKTkxPFMtX28vOOtyMCgUM4q
         ijbImj28r2Q1VPWpFGyIjOj24MyN1Sq4LI/kAXUSDKdSS+vGIjQJmuPYcwueiA027AoO
         7DZIkFv6xJzjTAu4rQNuhMoiZv1F09EP5cz9J7C9TGWylE89wiIlfLFlsuk2L3KuRhwc
         Tn5lUFotb7U61wJEYFLtfC2CUJsgIU6X6pgSDqlri4yAftxKBxd7GZeAg/gJUPm82BFz
         pBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ysi2hafA+ptpgLLenBdk3UcWnvRmrwggzaNQGDWt5QA=;
        fh=/Clldi3o+HYPxTK1XbYD7ZtQYc0c2VcGcLBCq6klEuE=;
        b=Z2hqjTXOpLMiImDdm8hWsxrzKMYF9DyK843CCaHN/jdrOz9I59kCtCiya3S+4HfvBX
         A0Z3Ebwv+N+FoyQ0ptcMve/bMWOpKFHDXmr1kaS5yZLA9JhTpVLeqHku+ufOniL5TxhA
         HI7BVOiCPaziqHPTXNArABU4mnhbjHdh+nSgpx4SJNRzPRS4TDagL0vNnGsrBcw5zPUf
         ls6KeUb/SwPKeu+gnwer9V8nqIuogBZ/Jjk6PWedAKbRkcH4w4dD7UKDfttll8fO3/1D
         OI+KmRRDiB4zPR0iFT8YsAqKC6ti6COzXc04m0186wDdAir5HB5S/b1weuX7eiylgd50
         ZfPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774979277; x=1775584077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysi2hafA+ptpgLLenBdk3UcWnvRmrwggzaNQGDWt5QA=;
        b=btmB3XFtp4LixOK2c4UFCeR5b6tfKUvUYhR3vnU3nFxkJHl4SrrkPapy+cHtb30M/v
         k1eXNFxhdIPR86KCcF51ufDyUS//+/wo3RjBmQTQu6lejkedge4KdU3fsh+PzNJP/8OV
         PtxHW274Ra/LVp97xypVHozFahjLQ22/etehT5ibRL2HZIoent9W2lsWOK4IZNWWktfE
         rUAcPv824IJX8EgDkjViOgIdIyU6sIH84G3U6vMUyKalbRVvU2COz0dOzghIK4RSlk6T
         B4W83BsNLiVSK4Yu6Z3Ucb3EBOWLFwRQzLxOmUW+/WdwxBLZUufRDHbCQqSNIeb7xW/4
         39zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979277; x=1775584077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ysi2hafA+ptpgLLenBdk3UcWnvRmrwggzaNQGDWt5QA=;
        b=OuMWsg3Hcs4LaNvINYk74LwKtQHgl2rncjOY2OsJCA6m4wAPAQS49nInkKIe6FguG/
         5QwuCYff5La3eEo5gGoumK3jFwWJpAURiPGYLhC0pVAK92G9xxwVFzwwC4ls2QoJz2FS
         rNX6kgtu9ko+HqFhY9inl2kBw/B7I7Fq/9+8GKGCz6PAbbGqngvHtr41PMZlcL7dhGZ+
         uRn71AXeJ72f8XiNzoggv1KtWTUzdFdCUNsZs7jtLnn6ekMSU/LKSanfDjDuLKfp8tMd
         93SYpfMEpngOgLtvXzkppI6k5QVR5nIBKED7sitsEyTGO8v2cPoJsKyV9GGjwuU/uPj3
         p1OA==
X-Forwarded-Encrypted: i=1; AJvYcCWjXI/fDaxrCaylCp78Sd9Ylq39ro1LWV2iSdKwk792G0fT+uTecJjX1Tl60mjT/MJqeWF9ut/DLmQdne0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw+HRJgdLCmX9o92Wdz/SU+fIZ0EwGt7DxlptgN52lmCJx5M8Z
	+7R5Lxuu6SSeBGq0dKo42IDL5RcqoNx5xy2b6mE3u2F7lA+XKNQsq+2scYbBrirQ+vHPFwCur6Y
	S1+M/wRXVc7N9IWMgwJvD235OCccRXnk=
X-Gm-Gg: ATEYQzwBZwKiM+HuQVjPL5xLwbQJ2Ji3ZL7YJQGBuGAL6C6XMSQ7ZbM8kGuPqCvXXNs
	8hvQ6m4BCjucBWMT4hNk6lgyhxzdSkleZP9Zoj4D9gIdDw3KmbVQLBm48hcJDtMbWOFBIUT0ZjW
	4lM4wAG1ukD2LVq4GnHXfqFbOv561BI3isY4pC7oprSDxOLozrHQqVTVnT3fJEmvegNsODW65Vh
	+vbuCGgLxHfii5aRzHGPPfmOx7gZkskoHapQC+OlX7CkYSvCPokWGJWLB5KXLql+INGhqXp2Jy6
	SRNbHWxzcM/HC6RduKpUUuig9zV4uwKm1Q8KGdIDsSIT03NjrwH9Oy0Ht8L9kI8X7DzWeQpsIdj
	CQJN8p72cji+WmmI2uN2umKc=
X-Received: by 2002:a05:693c:3013:b0:2be:1f56:ed0d with SMTP id
 5a478bee46e88-2c9333b1713mr40887eec.6.1774979276969; Tue, 31 Mar 2026
 10:47:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
In-Reply-To: <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 19:47:44 +0200
X-Gm-Features: AQROBzCQ6Wo3TBLhc4gV7S4by1XCetN63ihcS6-yEhM3XyLxgnvaM_4biv0PCmo
Message-ID: <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12428-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 96BF136FAC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 7:11=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> No stupid one-character things. If we go down this path it would need
> to be "wrapping_u32" or whatever.

That sounds close to similar types provided by Rust, i.e. if something
like these types are used, then it would be nice to match names if
possible (assuming they are similar enough, i.e. no surprises).

e.g. with generics they do `Wrapping<u32>` or, in other cases, without
generics they name them something like e.g. `NonZeroU32`.

Having said that...

> This needs to look _very_different_.

I think there is an actual risk of someone e.g. copying an expression
from one place to another, with the operators behaving differently,
yeah.

In the Rust side, even if those "explicit" types like the
`wrapping_u32` you suggest exist, we generally use the methods on the
normal integers instead, e.g.

    i.wrapping_add(1)

    micros.saturating_mul(NSEC_PER_USEC)

    self.index.checked_mul(page::PAGE_SIZE)?

etc.

The advantage is precisely that it is more explicit and avoids
confusing the operators when copy-pasting code and so on.

So that could perhaps be an option? Kees et al. have been thinking
about this for a long time as far as I recall.

[ And for the usual operators on integer primitives, we panic by
default (configurable via Kconfig), but at least that applies to all
Rust code, which is all new, and kernel developers get accustomed to
think about what they actually want for a particular operation and
whether they need one of the explicit behaviors above, so it has been
good so far, but it remains to be seen what happens when we have way
more code around etc. It does mean someone copying a simple math
expression from C to Rust could forget about it, though... ]

Cheers,
Miguel

