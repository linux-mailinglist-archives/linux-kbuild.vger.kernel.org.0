Return-Path: <linux-kbuild+bounces-3197-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3713F95DCC4
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 09:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0C421F24405
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 07:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4EB154BF0;
	Sat, 24 Aug 2024 07:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFBdFSbK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7671C148;
	Sat, 24 Aug 2024 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724486263; cv=none; b=koS0vyilPhLXqir/+CcOZfH1V5FKfqoGAU5tCJr0IIrlkZ0qMdI6IHLFTS3z4Uqc0T2XL5fQCRiFIFMynwInlDiwZnhsk6bcXieNpSuC+3c/XYOLfN16+ooFmuR1A5LcaG09jC39F+D0RvMLUNPDdjMsbWwUa3ujWOEuntn7Q1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724486263; c=relaxed/simple;
	bh=veqewg/dYFtLgmqnBLnDkm0LLpJEGT8ujx8IQXvI/Gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qc6JnDiO54Z/jWztdWf7n3yJBtVA1ozHB/L/4rqmZpWRAzOuMLWb+wmLaSOOJyVelsFa15aLc8nN/VCbSNxJmFItBISenYbSiH68x86xRsqHpdGPbDsmW+9JMINAOlekv2byf+TqfI80nwJUM5QP+CC/xfoibhWvFSoHhKfSBm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFBdFSbK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB65DC4AF09;
	Sat, 24 Aug 2024 07:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724486262;
	bh=veqewg/dYFtLgmqnBLnDkm0LLpJEGT8ujx8IQXvI/Gg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SFBdFSbKq2L/TWsU/7sOejHXvQQsVvGiCybcnxIOUYgkOoll9EQ//o9cv0rkoi/eR
	 Yi+N8AVbTHFh5tAuLn9f5xCPnNZDL4GyXGghI+T3pYb1qO0eOfXRtJMnp6andg3oYY
	 zK6A/2cVzjF59+GOC2TDUBbnbso/NWeoR7LIsZnQRYKt5MU/6yXOKCd2fAnOcZ+azy
	 BM6wqeQXSkOWtekjJNQ/AhSATo0DFXglaResL6n5MnISIEZMa9Xo4+oWxSxla2joB4
	 rtNtcJMyhKgCz8niRyRm4vNDpTBGnJACVBUN2CKKC1zn44Zs9QNH6fVkXI2G81eOQm
	 rvxpzL6SZHqDw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-534366c1aa2so1852211e87.1;
        Sat, 24 Aug 2024 00:57:42 -0700 (PDT)
X-Gm-Message-State: AOJu0YyWMlqXmjJSXqQo4Z4NV5KehgeyCBz52Ddiz7Gyga7yj3NqoxiT
	83NtKTLaQ9p0aTdpPWk5Kx2OUBVXQH/eyKbvjd1/5FmwoUrpJ/nZT7cWmDfrYnODfYV5bKwTr9u
	aCEs6EtZimSYJOK7vul+X7YL5/vI=
X-Google-Smtp-Source: AGHT+IHDMyWtpZNup4NTIkXwo3o2kIvdxJBx4oqBZqw8KlVry+nitbbc5QSRERc+b7kH1N2mjhMFmxOza6bQZqFvq78=
X-Received: by 2002:a05:6512:6cf:b0:52c:e0fb:92c0 with SMTP id
 2adb3069b0e04-5343883abdfmr2937704e87.34.1724486261207; Sat, 24 Aug 2024
 00:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812124858.2107328-1-masahiroy@kernel.org> <20240812124858.2107328-2-masahiroy@kernel.org>
In-Reply-To: <20240812124858.2107328-2-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 24 Aug 2024 16:57:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNASdNoxqdOdGZ_=tNMjh+4Du5Z3Y4EAi1rYPnuccG_1gUA@mail.gmail.com>
Message-ID: <CAK7LNASdNoxqdOdGZ_=tNMjh+4Du5Z3Y4EAi1rYPnuccG_1gUA@mail.gmail.com>
Subject: Re: [PATCH 2/4] modpost: replace the use of NOFAIL() with xmalloc() etc.
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 9:49=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> I think x*alloc() functions are cleaner.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


I removed do_nofail() as well.





--=20
Best Regards
Masahiro Yamada

