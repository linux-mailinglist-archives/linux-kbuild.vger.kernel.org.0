Return-Path: <linux-kbuild+bounces-12640-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGpdLj+40mlEaAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12640-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Apr 2026 21:30:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAF639F662
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Apr 2026 21:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D645C3006B69
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 19:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C062F745C;
	Sun,  5 Apr 2026 19:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRfJiYT/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE56C2F532F
	for <linux-kbuild@vger.kernel.org>; Sun,  5 Apr 2026 19:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417404; cv=pass; b=ZQHsrCCewrEyRWENhOB/Ed9tTt4ugH52RcBRu0ujKhDMZPgXNDudFYjEKJiRB5RnX3cC7+VQfz/0Yixq2bwXtZ2fDr5RQETphQ8cic6kmRboprwGzrpxwIGSehYj61Qxd8f+7RMBc8RX7x/7pX4ll9o2XzwwT5X+dh7rNRgmfKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417404; c=relaxed/simple;
	bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhmit1T/aaL5kz11yc5so2wbN2kTuaCuFqEt37QzQSvP85z+RzX6C5NhTMl91m2kCTH5mElDTH/aDraFfE+1aj1gVbkVu3Y75S4mceMtFu6z8iMbtfRfFp/IBSKO2LA7vxMqser3XwVmI67yWQafLLmWzhR27DWEHJqfj/C5gcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRfJiYT/; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bd801b4078so360190eec.2
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Apr 2026 12:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417402; cv=none;
        d=google.com; s=arc-20240605;
        b=Fp18JAFkvIWs8+DpBhzUkBeubBZG0hcof1i9rD8afVnxbmEDS3OGrZmXQHco7ysO4v
         /ZV2gWcpDv1MY32DfVMIIvXt92QHThvyD5vwfx68sK8V0gERxQPaxGQefHO1RpPLBdG7
         lEJYA1QGH7F3/zmsTh1RQUuAKLC9P11G1CrMG+HCO/KC2l70YA6leyUctsiQmcgchtCx
         Zm6yKmoUmbeyJY1g9B81UBQgiEDfv7yhsjf/zh/y+pgt3fy8iUtoSCZqqrCtNXWHvSw8
         PbaNzDxnDNyBJw9/IkXz8VdyjTmHNfAhjHFo3+/CW1T8g/4uQSpo467abL+GSHcckwyr
         85Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        fh=QC4qWfhR4sfw+/9VM4kdre2F/k6Pk54vVE97SngcJWE=;
        b=DzLS2YsKaZ/zZKFNG2WOB+iGV8Lx9dZDrTG8ruiLbpNLUqDtHtI2M1ilDF127yc9m/
         vn2NfW/zFRy1el2Mp+E9/jEpzd6ng6NoLRelR9ll0LolY6fOPuOoTwD7WPh3tQ9pOtRm
         /KvbOLxeXQ6qyZ6SiM9d+76wUlZqNJ1y6FX4XEQwpqod4rQqrvjmSWYJjdRxZCfZ8mG3
         1iBoocxk0URes8s1mAjHjZ0ypsccASifQJh8li7qVx70+JOT06ib/LMRqtWsvHYHBg5T
         JJritaq5Iueot/mn6Co5q7GZ+icWSqImGnl3yCnXjCF6bU0LtF5PaUybPZ4j+ltkVstv
         FNuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417402; x=1776022202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        b=mRfJiYT/+olK1iMcCR1Eq5zd6EtYOTPK4JjL5RlYfH0hC+yPxbhFtfGeBKeOVVNDpP
         cAbjCbe9gDZQEEaEAYDH6wJGt2ogaBEK4SrH21K02nQOtwKHt5OloY88rxjSzHcEL2qj
         HA5oy1Q118CPqkIy7UOTuJzcKoulpGte/Msdgpp4i99bjOviHP+vaPuGXMxoYxCsvQIp
         rG1c/qF0ENmYdCWW5xxLhxtuCMsHH1A83FMtBtZIA+v6cJ18kxJ1G6f10aKzVCZ5AWnO
         etgmpMTc25U9ObytySL+cEJgB3u6MoPbEdD3KxUPbP4zHyviw7hMzRRL4HhsBuljW+PZ
         G/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417402; x=1776022202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        b=ZTK7pM+K96d2y5FwBNUbZe+huZnB2TYad74RR2/wDuJiPmt9Qz4B79lKAlKmtQ+iK1
         QFfCTAkuztG0hHmwtM5C1bNcm3SI+WGfOTcOq6ehl22gI6AAga+Ev4j2ODAxUl9d+5f1
         Bxxu/zVYk2R//ViBGFCZjqjve+vCRHCkvfCQMkZQXB47BV9QaPzmvBBGcr7oCqs5WyeK
         E4IqvJVjLHjgXRCP5WAO3QNTSpqzFDlW7slWZZz4QMdSA8C7jSnMrjUBjGnBSYT0WICt
         kqdQmhJfbz7tqhc6bSW6IKSHTayuAzK/mktoqb5ozce5+zV6BzFU7qtZFssw+drqIoag
         /chw==
X-Forwarded-Encrypted: i=1; AJvYcCW0bMKbA1+G6E8dXgsk3LcOymSQ8GG7ivG/DEQNcWV9Zklzwu9a6+2jNoh5U4UWeUgoMM/qUWO8AtcZmUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4owZBeykrm8U8UKznCATrEfC3uqWBnetKALjdh1WCjbSyEEG+
	zX8r22DmyVTc4299HnAWjjvMJ+hSwSv/g7yfg7aFHbozaWgYrOH7Qv+ABEUQQW63xjM34IokyZQ
	jGThTNPLjz9WEgNNrrAMasTuVqlNCKC0=
X-Gm-Gg: AeBDiessGGuWQmzXEY7rHDVhnLKMN0a3XrEkDNWeeUyNh+93mzqAt18OF5D38LTepb4
	SNH/LVdCh9sDDQr6EZEcdIUU6wqSXHERYSaUfrO3x2kdLA1SA+0s8brlgIkhx6oLQFKnoJUbeQJ
	vj075hstp1h8CCBMSeOSMkITDttDx/IfvcLBoSY2Am2G+z8qd0AK7fSupRRluR8RCwy11HiUH1p
	kybEBF4FsURQULFYf4NWg2SH2SNexf0xWApJh04avCT2tANMV8nH/FGV2V8l7PYHHHcEIy/nnlo
	8YP4ee+FpD1Wmm4nsmfHiA53iLCHQmUyZtgMSFSa1fxX8D4zYudAHUYh6DMxft7PFLqy2Xkdorw
	/egoTblqhLJQVx8jv9SYFpp0=
X-Received: by 2002:a05:7301:1688:b0:2c7:2cac:8149 with SMTP id
 5a478bee46e88-2cbfc95a78bmr1941319eec.7.1775417401965; Sun, 05 Apr 2026
 12:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-11-ojeda@kernel.org>
 <177508434443.73816.5437391869400189147.b4-review@b4>
In-Reply-To: <177508434443.73816.5437391869400189147.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:29:47 +0200
X-Gm-Features: AQROBzCJ9cjSza_PQiGX42eHlVtWqYPN6hP4vKeYF-tVAvlxpiXLyawV-TKZkT8
Message-ID: <CANiq72=EL4pEagthmrQ=DTNe8-5jWMfgxxx+fsj=pFy3EX0zdw@mail.gmail.com>
Subject: Re: [PATCH 10/33] rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12640-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5BAF639F662
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 1:00=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> "beyond" is probably not the right word here?

I think you are right -- reworded.

Thanks!

Cheers,
Miguel

