Return-Path: <linux-kbuild+bounces-1639-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6C88ACC86
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Apr 2024 14:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60AEA1C21036
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Apr 2024 12:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C308E145342;
	Mon, 22 Apr 2024 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1BsL9i4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E18E524A0
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Apr 2024 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713787836; cv=none; b=teR2860XQpPGQQTEpTlFKA1InHVPnvM49RYwyvR7tD3Ce7Vwp5Eb9jMTB3f3zXiHIRlRN7gP+K8qCwXHIXCN6y0oaSEfMw6pqE24KcRsVDh9KS9LtXOxZv2hBPV27346f56SElkDLa8OcBk6Ob3uFkZa5GvhAEONoZ5b1bVBGfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713787836; c=relaxed/simple;
	bh=a/jkvHDgvp+aCgDbduR+rR6Jv2ent2+kn/DG9bps3JA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PbBltpVHZC9lgUpTX6/9S5ekVM2JagJM8cqc6F7Xb22JxL6+tW1BbF/Yl8iiHg9MiabxBoP9O47Y8AQQbIkxM6u3XIQy+G2M1U64O2ZaY+AmrLVVHLP8JTV+CgkfjOjjppGaUSbrTqXPd1dKq2fRnGWw58K68SPkS5Km6/XEHiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1BsL9i4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39677C32783
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Apr 2024 12:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713787836;
	bh=a/jkvHDgvp+aCgDbduR+rR6Jv2ent2+kn/DG9bps3JA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q1BsL9i4sLhSthk7FETePYybI8nJ8qcbcLdVs5boz4b9rThuxt5r/RpZrPZNIF0Z7
	 DBwZFAX3OuhHc64ZdDaPyerKaO+/+0iyeJKt902BPRglrCUwBDobb/Ph9NvaBf8uFd
	 EoJjvR5yc1ECv2nIzJGez86vy+c8YdMKLUb9QwCecu9Axy+w+GwY5FreO/hJeIiSUO
	 BNSmCAACQcl9bV11rVORk4WwYXdloG4mLfIwvvvtiiycBgADiEytWqk0MFD97F1rYx
	 mxxAKsW+L9BX5IJ8oc1DBC3qSthSadefDWtP62Fyfo6GdMZWXR0n/PyHFd9gHPeLZE
	 3Fuo8P8FV4zyA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d9fe2b37acso58635521fa.2
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Apr 2024 05:10:36 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy58A3cInVXzfwGsfwT2A525+nEdfxbtwps0n/Vg5Sco81mSIcb
	ozctia6mBvyp66JDBlJwmRuPThGKphf8cSapHPPJvmIXq26lFm31AVuS8V8R6rimZ8gx1xetkd9
	2aW1SAyCaAaBGF7R9pH3MdWaaBFU=
X-Google-Smtp-Source: AGHT+IFnT9oIlydPM9slHFIGQ4nlDyC4pxuRciGfVPGp92isj1tegycIlBBjmx5VvPj+2j4jccvDvssOYt9K0St2uGM=
X-Received: by 2002:a2e:a554:0:b0:2da:50f8:dfab with SMTP id
 e20-20020a2ea554000000b002da50f8dfabmr6690473ljn.7.1713787834707; Mon, 22 Apr
 2024 05:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240422092206.147078-1-sv@linux.ibm.com>
In-Reply-To: <20240422092206.147078-1-sv@linux.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 22 Apr 2024 21:09:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR3R2MfP69pbXNYx3TCeQiaC-Pjb=zfnMifHRUvhCQA6w@mail.gmail.com>
Message-ID: <CAK7LNAR3R2MfP69pbXNYx3TCeQiaC-Pjb=zfnMifHRUvhCQA6w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] objtool: Run objtool only if either of the config
 options are selected
To: Sathvika Vasireddy <sv@linux.ibm.com>
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	peterz@infradead.org, naveen.n.rao@linux.ibm.com, jpoimboe@kernel.org, 
	nathan@kernel.org, nicolas@fjasle.eu, mahesh@linux.ibm.com, mingo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 6:25=E2=80=AFPM Sathvika Vasireddy <sv@linux.ibm.co=
m> wrote:
>
> Currently, when objtool is enabled and none of the supported options
> are triggered, kernel build errors out with the below error:
> error: objtool: At least one command required.


Then, I think CONFIG_OBJTOOL should be disabled.


>
> To address this, ensure that objtool is run only when either of the
> config options are selected.
>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> ---
>  scripts/Makefile.lib | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 3179747cbd2c..c65bb0fbd136 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -286,7 +286,10 @@ objtool-args =3D $(objtool-args-y)                  =
                 \
>
>  delay-objtool :=3D $(or $(CONFIG_LTO_CLANG),$(CONFIG_X86_KERNEL_IBT))
>
> +ifneq ($(objtool-args-y),)
>  cmd_objtool =3D $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@=
)
> +endif
> +
>  cmd_gen_objtooldep =3D $(if $(objtool-enabled), { echo ; echo '$@: $$(wi=
ldcard $(objtool))' ; } >> $(dot-target).cmd)
>
>  endif # CONFIG_OBJTOOL
> --
> 2.34.1
>


--=20
Best Regards
Masahiro Yamada

