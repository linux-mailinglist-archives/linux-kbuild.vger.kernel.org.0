Return-Path: <linux-kbuild+bounces-12682-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOi8COT60mllcwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12682-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:14:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7BE3A0D6A
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1DDC3009F8D
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 00:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DFA2C859;
	Mon,  6 Apr 2026 00:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2EL+ypO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B247EEB3
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Apr 2026 00:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775434456; cv=pass; b=gQS5bE/Y/XiizxO5Ch/sdD5ozaAlNBQhlWyHOScxHKFDtqe95hTanh9lwYsGBcHNLCp73CzrFUJz2VoiRst/2TiaDb/8Iriu0Pr9W+I9J+2N77wpoqQBb8ke8vcvquUtqoga1UkfaWLlLDZ2EeW3z9Y13rPIk8YMZz//4OGSGZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775434456; c=relaxed/simple;
	bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSR0UGt8A77EGOX4vzoKNGgI+/3eNQR+vRo63rmf89CwQZfrR+hXrhYGlaMIdrHPIhVq2k/R8/CL+9bkDR6mfzuieoZtw7xNRZMtUgarWodi40iU99vyuxt8hVYsLyIFj/9YJOqfS0v/GZ/7V+cTxHYPCH5E+Zx6+DSdviMJby4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2EL+ypO; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2cc175eec4dso122036eec.1
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Apr 2026 17:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775434453; cv=none;
        d=google.com; s=arc-20240605;
        b=jasM9aoN0KFtU0kiRbCb97IAcIp4lxaotmoyyvDAyyvW/xxeaqQBmOJUQo4P5zPRw7
         4bwAuQfCdKwk4t0uuvwGpjxpHtkTEDKOFtZ84rPAESEOG+3hAJF6aDGilpK4tW1vOEtl
         KuF5up2Cx1v7x5HzNjOCgpkBkp5TYVi1qE6uu8JnF714EDnmRrHY6w3t1S30agT38X0d
         MqSJWMPvInR6bslMOUSJqxPO82rAmU4SfaCyBwhUy7RkZEUmlBYA/SBPpLnCad2l6WY4
         gt21x0kbmomvdswo4pRcaS6iRs7AhInwWeVpwaRuO4RBVX8UI/0XhTTRknVjFKnDMUpT
         qiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        fh=Nuu+scBFeknEWiJ3H+FuhZP+yyiugE0eGMNOOttB67k=;
        b=eb2KsYvNgZCqc7G6axqiqJPWxx6nC8x3Mc1PeMl7a8PKk2ZGUjhMzDUP6zu36fkIgL
         hRYeiBXeYoYdjS+TIfVsaRD5EoqiC5O7/g29dndSR1DAuRe5NKbWTWSy6Q4Cd9A+k4mJ
         JKRYKRQZF6XfXeV/SGscShN3h9kYss3qdtSd21/eBdv5eMa3LyeS9dpnedcycMJKK1l0
         VYXzZhsgqmLl2w1MIIO3fAennzwa7Zxu2oKeeSUSwaKFgs12GxVejupOVkJ+hUbIXH5m
         +UG/1wq3N77ynf8qNzi1kz2blZ4aCWXvk8/gvn1V76g5AVJzR1Q58Zo/GGq8OywbJlIf
         A5gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775434453; x=1776039253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=W2EL+ypOcsaqQ4DoOhrFDh+b+1lAXR2+PfuzgePaD3QyLeW9tXTGFiV3lS1LJThAeX
         NaxY/oEFMFD0Y3i01XsEDpIhm8gOXMv0koKcxOIKicMgMti/P335kHExMP467YZP+Yn4
         Yy6jC3XqkJvOPhp1FwbNbESJ2OFvctUAgwlzHRAqS/JEy5mUEC2TIcLLwoRD8IU5BXHI
         EyvU+eQL2oMhpSEi0gKa3v2+Yk9nWVoOpuiLpMemSm6bu1MU8SModMlqUbijJ15Z0Jjq
         EcINdtOvxyfb50KcfPS/u3a17tCbzMlIBmnJAh2YlYTp2SQTFwIRZOigAmxIK6ERVnZn
         bqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775434453; x=1776039253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=MFAxxLiP1Xc+CXg6okmYyY+BwEbozKLKQysgh7aJ/Y61KiwPlp4KhSokyFsrZdTy/Z
         /mTfwG5xka1FrprzH+VGfVjy24uZomkjdbx0LNgRVSxYKolSmaKewri5Wr/PBDbQsAMy
         CfzfSwKcdQZ3TcUvPjJtD2upFa4cCCuCu5xYeoWbu2eVKWWSM/XQI1lo3mr4YlKOs3C9
         rOjiufN4fpjas1wDsFgwwlD2uS4TGUHohd1likFppuyJkB9IMDObeSKvmexz2BYD6/8h
         RW5RENYFDqpYWbzwkM5D+HquINcFikrPkPwe32lIpJOcc83hI4rYG8xu4uvZpw3KJ8U/
         3ujQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8bctsCW5DYGaSSW0f2g7pVHcRWwgRHAJZXZ31uwcPjI6LeBYKuj3vzhEFdthPaOqGQwrOrCnesnZJP60=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWeCJMDE8Lhdr2hmVWHF0pEGdMneEfFvjjMvtSEpENXBDprZ80
	IQBJCUXmgWqvFRp/vePnBl3PZ2TSMyyoA9ZV9fdmmFkXTLv+awOnIIVyU6qqP5u1R1gmbSp43P5
	frSNNM+dsyrwovtQzTeFUPS0Ni/pvg1g=
X-Gm-Gg: AeBDievEdLPGdaqntwqKp2yOACtaPMeGb1iHjzXZmDt80JFJq8zJaj1ztvIex/n+7yh
	0CnTUY76Amt4Obr08NxnI5g8ec51d2EBfgDS85xmArWgR5BAIt6Ss9GwIWZi1jyUSYO9taWp0ED
	J40jHYts9lr9nlUMuEIQA/9bg+z6F39YEEL45W1HIfQGs6VfHJbuHb0orju2sMjjGRhATpKZAjb
	u46SkV7U9YZmx3v9Mm+ErX/Q94oTjp2DFfey3USYUUbHG2YhVzXEsMFQBvglYx7Y/vNcAZWQFHn
	/xaBpmuCz01vhge3a6L5/nGGoWiIKvV79Oq2SqcT7scd6oHKoPt4mUFesUbLSFRyLxdFK/tWgPk
	uucmDGxBIMwxqutL2q2wMrJQ=
X-Received: by 2002:a05:7301:6784:b0:2c4:acef:291a with SMTP id
 5a478bee46e88-2cbfbc7dc06mr2181016eec.4.1775434453241; Sun, 05 Apr 2026
 17:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4> <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
 <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
In-Reply-To: <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 02:14:00 +0200
X-Gm-Features: AQROBzC0xKqhkvjW35MYEt1fkyhl47XKSCgdBG6b_PFaPBKsGPkzdO2Dex1iVhA
Message-ID: <CANiq72nPjz4FiYUDDV5Xw1=ychH0DrhVN88hjygBnawLf7oamw@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned packages
To: Gary Guo <gary@garyguo.net>, Fiona Behrens <me@kloenk.dev>
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12682-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 7C7BE3A0D6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 2:06=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> It's still required.

Thanks for confirming!

> Perhaps having a repo in rust-for-linux GitHub org (or somewhere else in
> kernel.org SCM) where we can point people to?

...and for all these details :)

I agree that it doesn't fit perfectly within the kernel, but an update
every kernel cycle or so should be fine, I think, if you think that is
enough.

Otherwise, regarding the repository, that sounds great to me -- we
already had an old https://github.com/Rust-for-Linux/nix and
https://github.com/Rust-for-Linux/nixpkgs. Not sure if Fiona (Cc'd)
wants them, but perhaps you could reuse them (otherwise we should
archive them).

Cheers,
Miguel

