Return-Path: <linux-kbuild+bounces-12170-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGrxDLpOwWmhSAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12170-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 15:31:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7812F4A77
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 15:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 963C9300D548
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2D038F630;
	Mon, 23 Mar 2026 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANvQ4kEo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD7D1FFC48
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275870; cv=pass; b=Takkqwcsowi30FyoclJdIBdIwkj6/HfrNq6WZKbQ+HnaB2KGLYRudahOT9mL0at5VOcYo8Mak4kgNoWm5AVsc8DNzmsL3vHXwRq4jVD4E3ohJ6uGi8l3iAZUHLkRAmiP8GAJjWrrQ8LCQrYm9f8O0kt7DCCiBK5bUMS5BaXBumE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275870; c=relaxed/simple;
	bh=NmCKdm8Hpc3KKzPb6Sjk+NZScosRjh4V+rX6f4fvYOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L56QH1ZC+akDg6fljnyQhZ9bONtnxPkUeph/S/LMPM7XXUy20zhijj5JDpP/1VVUmN3/iYhQ7tEEOd6oUMmlfkO17wgaleztYX8yVEyiZkVobLvjehpyFKlzMVxI7tyV5TTLkfLQNtBETWX7Q2MLbYuKeS7FjRLKxBsDk1lwNCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANvQ4kEo; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bd5658b901so160027eec.3
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 07:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774275868; cv=none;
        d=google.com; s=arc-20240605;
        b=WdMjK8nEvwSfBr4lMaXmZ7HS1shA8ADQ3AeDmxRw6KJgWgDlySO/T6nLDsb79vEN/Z
         NEMDDjFQfFm6KkEeXUqZkLKHVR/+XSK1pEBdfofZTIsi/L+g89iAJ6CrfEoNKcoRIAwM
         nELR1Pda9F4BT8v3N0NQ/pjj+ESRB3stcD9s45iawcmuA31NQCRk8IJnXvRwOzbnnoaK
         Be8Y0m5CHI6yomFhl4Y4UmkmF4yYPd0LTjfyxvElJ8K7juX6YHPCgVgCR9W8NCjqOiSO
         A7haNUBLrVXjyNQSJDXFUzrTnur+/y62tNEgwDw5BbLh7mw5wlYCG7wAQZbTQQrPYmn2
         nkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NmCKdm8Hpc3KKzPb6Sjk+NZScosRjh4V+rX6f4fvYOI=;
        fh=JZShmwNLbUOjFWY8+qBa5OFoGlqvi7mlqcIsXg13Bu8=;
        b=UgHtRmc7t43pQ2jIcgiSASspm48VLeHb0NngPxIKyjaLUiiCS5JcVpGwX16xYbvJ/E
         1sbGrEQmpWPrmiVGm9h6wPiy1o1abVb79NujNuOoBraTjYPgH55IJpDnbQ1LBpECDuE1
         tHvV6dysEV8LlmiofBup+htctwfAF8Xc8wKvSs3hYl2TyWJEOCv0DUuxNCVlTs0KdUdi
         lhTHQxWWGmBL3KSjPF2O59ZYS8vd6qSDTbtiXASBV5VVFtxVNkY/9gDSyKeaGVdBa337
         hVlUPcUPhBiulxEvyg0pIt61BJVnp0al/M4jzCN/cX5zckH/gwkoslNrYMVTuC18P6nv
         NkGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774275868; x=1774880668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmCKdm8Hpc3KKzPb6Sjk+NZScosRjh4V+rX6f4fvYOI=;
        b=ANvQ4kEowX6ctjhFYCqAZ/zTnBV+x7PhMgRa4RksinhHtMHKAuk9BeGLKuFOR20Nte
         NaWoMzcw/FRyGp02rsA1jb5x+aNAuyttYez78eKImwJL3kkg8H1Kp++sbIjP5OOU/drw
         M2IjZ/An3vK9LM3ommwnf24ZcWutl+fzy+9LNkpgLOaBb9UdrcoymxHHSgMyHsfnAktn
         h+oFn4tRymVdusCWl30JyIoOwgLX9liY7FQg8lDTR5GuobEdkoYLlZuYrP4rs7GxNjBx
         iyBtt97tBIXiBSQrqS5HVo3s8XOHyiJAP2gF2UAqSKjeuxFFkai2jjfzJnyKA/bV0rEx
         kwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275868; x=1774880668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NmCKdm8Hpc3KKzPb6Sjk+NZScosRjh4V+rX6f4fvYOI=;
        b=h5wSqKeZZXsh2cBIG9SlkzgV3FRkhiYeuBtGT3o8knsZl/wCmeDRmslIeiGT1wxMNY
         MNXog07XGFQWWhrvTLaRPQ2LmsdYIOjTLoS0JdXQC6W4/qYBLu1NBMZoUli0AkoaE5g1
         4crQPFTLPwOi+M9bzQBSJEi+3HzwhTawbqRSkyIGKgwkw5Bqf6l8jdVbs2J691sc69rO
         NLIJFGvdKMMJH6WPz5eHcfGs3idWn013cjElDcrQwItKRIYHV9GF6YKYQhxK5KwZ1KAW
         3K/SmLT5VLZ1hxBNXdsAaJ+FkEG487zCKnOzhG5UN6Wazkj3LJoN3pHfTBTkZ7U6ZCCp
         sR7A==
X-Forwarded-Encrypted: i=1; AJvYcCUAbcvIYx0qwXemEXURYTTE9D+exBvGxgbwGIFh0Qsb20Xmy5jnIPex5hGRKcoOjGu9oJucFPQXbgngDKE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/jjtdRiXDLFhoVRM21JeyehqUFe4onkhPRgniEUzMgiRPcyEm
	w6l7EXTugafdu21pSckAbmPFsD6UWZlga0AgVRu8qloPj8HUA6LV9OT9N2I7K7DfQJVw1m0WvVc
	J3Ppv/knjRmlnLIrYR1wsj0yTdyyLsNw=
X-Gm-Gg: ATEYQzxcQVDi2sTJZFzNhrZ1zjVhF0h/KeVxlZxtNpWiTrYCaboTtheo5i0+W2CnSCw
	9xZ6m1QkfQ3KR8rn+V1A65aA5ZQasKzUb0iqVuKvrCKHcgtQ81QAzH2DEF9u87nK9HPtL8a9Dhq
	+j/E+xIIebz+u3h836dxCoGlKgtHK/VR4mZ0ReWkVckauHN9AXlQ7cAg6TJXbGSfi/KW/TZWMmO
	J1Xmoc7c7BIm1gEnXFOoAdBOdgnpMi+ybUajzJ5UdADaFeB4+UnTmTay6U6X440P8ZURPP5aCPw
	lK/VhYpgS6NQOer01hrSKHzK17dXX1Zo9zPBT0sHqeRRMMSqEESL3XDgXimum6nNJnGCdC1+5mw
	0zRXpo/INCGhQd1Em2s6BciIkDGs2qUpLfg==
X-Received: by 2002:a05:7300:dc94:b0:2be:6e6:e479 with SMTP id
 5a478bee46e88-2c10956b92dmr2532830eec.2.1774275867800; Mon, 23 Mar 2026
 07:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323130224.165738-1-ojeda@kernel.org> <DHA7HNSWMM5N.KPC9AUN2HDHR@garyguo.net>
In-Reply-To: <DHA7HNSWMM5N.KPC9AUN2HDHR@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 15:24:14 +0100
X-Gm-Features: AQROBzAmfgdHr-kq6MIVGANQ2ER2Fz1DKErHcHlGdKPXdISrZZm7VssL1t98GY4
Message-ID: <CANiq72=umSRNNRP-KoFFSe1vYtUf_U3hQhRkGSuLp0F1eQ-0dw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: allow Clang-native `RANDSTRUCT` configs
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Aaron Ballman <aaron@aaronballman.com>, Bill Wendling <isanbard@gmail.com>, 
	Cole Nixon <nixontcole@gmail.com>, Connor Kuehl <cipkuehl@gmail.com>, Fangrui Song <i@maskray.me>, 
	James Foster <jafosterja@gmail.com>, Jeff Takahashi <jeffrey.takahashi@gmail.com>, 
	Jordan Cantrell <jordan.cantrell@mail.com>, Matthew Maurer <mmaurer@google.com>, 
	Nikk Forbus <nicholas.forbus@gmail.com>, Qing Zhao <qing.zhao@oracle.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Tim Pugh <nwtpugh@gmail.com>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12170-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,android.com,brauner.io,google.com,protonmail.com,umich.edu,vger.kernel.org,gmail.com,lists.linux.dev,aaronballman.com,maskray.me,mail.com,oracle.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0F7812F4A77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 2:46=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Can we avoid cfgs by always wrap things inside anonymous struct?
>
> The comment says "This anon struct can add padding, so only enable it und=
er
> randstruct.", I wonder how much bigger the task_struct will be if this be=
comes
> unconditional wrapping.

Yeah, we may want to do that -- please see
https://lore.kernel.org/rust-for-linux/202512092319.ECBB8613@keescook/
from v1.

Cheers,
Miguel

