Return-Path: <linux-kbuild+bounces-8239-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DAEB14DDD
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 14:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8FF83AA63A
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 12:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C64A1758B;
	Tue, 29 Jul 2025 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RE6iphOR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B27CCA4B;
	Tue, 29 Jul 2025 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753793220; cv=none; b=TEImRU6vAcYToF3QLFXQ4EKZyodkjV7IoapjOUipTEU23bMMhVubxwoagDe80z0OFkAdqJ4QdfQVDqAsFlnesjyP07xnMqlzYSBCqrqqavA+fbd6ysiM86yo1EzAS40Krc7AjeYix/0hof74HGR2O0NsYYrYjmKsof1RDAmlsBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753793220; c=relaxed/simple;
	bh=pSxZrRtKB37RBXfgQilXYs9qwW4mXmPqnlcZ4Q26lnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9YfpfNKwjDSceu96S02QI8LjwAkdAXESKtAzwCr/jBhV2xrHfiAtsl+z7fQCCBD/mtyXpD0WuOUX3jd1M9+l817LAkzEsU2OOmh9qQ93mdTdkgMn8w63xLe8vjuWmkywo/DamrqZ+hkAGQU5Da3DQzkhIV6ofLvkIk3fy2RLW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RE6iphOR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BEFC4AF0C;
	Tue, 29 Jul 2025 12:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753793219;
	bh=pSxZrRtKB37RBXfgQilXYs9qwW4mXmPqnlcZ4Q26lnI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RE6iphORHcN0tWT8qmyo4mXCB6S/ZSnDEhyVMoI3iTjyDEPpmlRKi/V4iieaS5mSN
	 mn888xGhsygukPllLlalrpXi0lXYa9F9omcHbe5mYCfYbkWrfrxUDrj32kqtiKfZK1
	 HKbuaVpeWsFCK2enCpoWvS0GAktZTZgXTov+uQ+fO+LymJ+mgFQRzLDGZL9IbQbuwP
	 tOGWsi23PX7kqkDXwuo5L+dvNt3Ft0Zcooa+c8RJTpznmwvC07QV7Y9Oy6+8mZRHvx
	 uUF0JMomoUrRgJTISm2YgWcwe4ruSK4i3HnKsKRw1+W88BGBssUfrjImbaaICQFd1v
	 iBvDgWd9oBGEA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55a4befb8ccso5834906e87.2;
        Tue, 29 Jul 2025 05:46:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6LqnI5LoCYMtDXuJxhjfbCTa7DmQCsOB1C7vdqadOqzKc+qwM+mVpFjvpkFFKex0cdbewsOjv4FN5Kg==@vger.kernel.org, AJvYcCV4lDuS7nVndlxMrGPaAd85+tS7BI0MRC4/ybwEmTRi5X/UVgN5PrPkUOjPOq2/26OBTxVAVA7HktoUxJVV@vger.kernel.org, AJvYcCWxvhnbNHfLzdFwozxbWQ2viSeuYKAhck9VpbchRog9iHScj4DGWunk33Cgc3TYnSlLiRpTBcg7Oi4TFdQ=@vger.kernel.org, AJvYcCXGG8T5bCBKqS2XSuS7bp1xOCtS+5vxmMaX89MIq8u2NaWe5lvUrJOiyhfz64T7HTcr30A5Lg+q8HHfT4d9lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMvspD/dgDe2tuytP3U0QPzJQrsyJ0/F8U3f3waKqi9mqtx3ou
	4FH8inFlKgA42OX8Ii2xrwvzt/So2smC3JQKzN9jYVtVWkjRBJ3buuhTxlfIComdm09XmSUZFad
	giAiyyHY5RXEf66DeukupRYgLVdUAH20=
X-Google-Smtp-Source: AGHT+IHG+v0gW453Oab/t2M4dM8um3OPyy+KQvBlwatRkdx+gp+IKZffTxCqTgYu9lnvHSgMNlUVlZYfaEkykY94Bnk=
X-Received: by 2002:a05:6512:a8e:b0:553:2f8c:e631 with SMTP id
 2adb3069b0e04-55b5f3d61f9mr4497071e87.9.1753793218480; Tue, 29 Jul 2025
 05:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1753354215.git.legion@kernel.org> <2860d5a5e7c6279b3836537e20b0fa0c40d2ba0f.1753354215.git.legion@kernel.org>
 <CAK7LNARV+8vZPUtX8iG_hEAt8tCchRPFobK85tv9dbJwVqYgsw@mail.gmail.com>
 <20250728140109.7289Ae1-hca@linux.ibm.com> <aIeUq0qYXoNIePwd@example.org>
In-Reply-To: <aIeUq0qYXoNIePwd@example.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Jul 2025 21:46:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ2kZncvHHbpupH+hi2-fM1sN56-9x87bCn0m8yq8kyrg@mail.gmail.com>
X-Gm-Features: Ac12FXx0Y0CXjfDuMmhy2bf7AH9tpUINCH5Zoxp2_WwCVs36c26t-Zu6bwCkN1Y
Message-ID: <CAK7LNAQ2kZncvHHbpupH+hi2-fM1sN56-9x87bCn0m8yq8kyrg@mail.gmail.com>
Subject: Re: [PATCH v5 10/10] s390: vmlinux.lds.S: Reorder sections
To: Alexey Gladkov <legion@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 12:18=E2=80=AFAM Alexey Gladkov <legion@kernel.org>=
 wrote:
>
> On Mon, Jul 28, 2025 at 04:01:09PM +0200, Heiko Carstens wrote:
> > On Sat, Jul 26, 2025 at 07:59:16PM +0900, Masahiro Yamada wrote:
> > > On Thu, Jul 24, 2025 at 10:50=E2=80=AFPM Alexey Gladkov <legion@kerne=
l.org> wrote:
> > > >
> > > > Reorder the sections to be placed in the default segment. The
> > > > .vmlinux.info use :NONE to override the default segment and tell th=
e
> > > > linker to not put the section in any segment at all.
> > > >
> > > > >> s390x-linux-ld: .tmp_vmlinux1: warning: allocated section `.modi=
nfo' not in segment
> > > > >> s390x-linux-ld: .tmp_vmlinux2: warning: allocated section `.modi=
nfo' not in segment
> > > > >> s390x-linux-ld: vmlinux.unstripped: warning: allocated section `=
.modinfo' not in segment
> > >
> > > Thank you for root-causing!


I applied this series with patch re-ordering.



--=20
Best Regards
Masahiro Yamada

