Return-Path: <linux-kbuild+bounces-10396-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E415CCEC524
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 18:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F351E300C0F0
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 17:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E34929ACD7;
	Wed, 31 Dec 2025 17:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzIRqTTC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC812264A8
	for <linux-kbuild@vger.kernel.org>; Wed, 31 Dec 2025 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767200876; cv=none; b=hEB8EFuK1nfbWA56ebpIAhZIANx/9Q4Ggd825jx6U65ei44Ss58jXezxoY4I61d8BL+3HXfAxMOlyr6MwvKMVJG/Ho5yuzS7hf/jGOL38XLZ7ETtJRV3398/gjKJzIUID1fdGpw1nBm31ztNiN8RVXwyWFoFCvRp/EmXRTwQlfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767200876; c=relaxed/simple;
	bh=iz/UUlvU1upnV3KH0c/iPCBatJHmNiwakC/d+LY3L/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTBybEr9TeCirp5ymZov/UOTpQ2LBdaDlhPiN+Z59w/gnZo0kJauNH4DTJY53tUUQAdT7Iaw14vItSJPBJSw2X8qbeFQIAxFgZR45rIEX5TaGS79MXEtUHsJ+7w+r8cW5W364qyR++lClodLwLho3fvmK+OWU2rIFSTzkzjC2pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzIRqTTC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42e2e3c0dccso6570588f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Dec 2025 09:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767200871; x=1767805671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLSVM7oT2x+mygqgfjoFl6JBKT9XHb0lY82HBBdL4IY=;
        b=jzIRqTTCVdhEKKNGlwCIi+eUIBVfhK9wcYFD5AVOC3i6TjURwa50tigvn8003guT/U
         RaxPVxFlVmHkTjnrUpdkrEz81IU54zhBKM6Ck45bK0QpjBhVTjYHGzrT6mcwDrVhxnIi
         aMrUkv6HUdPmeE1aOUHUGCWQnTi4nZRJvVnN09seE+0QcGovDhypePzbUy6RZVA9qvXr
         nn1uejQpafAjJwU77KrGgEOGTPYbtDdlxw3f8GzyS8aUZVQMuqYh3ejuYd/HU9CXlNco
         ITTH4i0ghIfeDBgGm0wxQj6+M+TGN4AXLlLmvx6uzFweclgEZURDpGNN2m3eTAYq91LW
         jh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767200871; x=1767805671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jLSVM7oT2x+mygqgfjoFl6JBKT9XHb0lY82HBBdL4IY=;
        b=VXCSy09Etv4DViP/c92RuSKW9gOBhjrzOqKvJGoB/JLQPuQ6L1N6J22TVusC+nL9ao
         FP4YLG4nQXHBfUKkcak/mShQLLQzCDsxe10yGY6yfHYJrrKnERlQrK4Q4zgG2MlqfZBn
         xqrMz3RVimXL6Dj4n7nTjc9q8nMwnwVL33PnN+FDJ8qsSn+wPAslj8V/VTGRwrysyOZH
         LOPfoX5mjKN3rDxSwI/UbusTiJAjS3/0kyuNOXdeFJHqug/z3A9TBAbZIi97ktvFkrz5
         yb2Xgd4hC6THppziTnuVSFb0tWjN8DBKSinpGfJB8WbiRDvxtUdmP4SXkLIsyPpRNg3e
         ZSow==
X-Forwarded-Encrypted: i=1; AJvYcCVd9mDihBJ91sELFtIC4nF8wm7XZTpcD2Ql06TS7vd/5h7UduZf9f3b4cNmk22vWBMDHB3tZUvygrxfCIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCd3Pozj/J5qyLEsbUBbc69Ar1gYLQzU4xZ0bfnmGVZm1nIP1T
	w82zB/lf9EbSH94Xml/BgoXnIreJ9D2B/CwozdAwy2DCIX3f9ck9UTrZiUv7Dwg64/XrOw8R/D7
	42sMz58TbUkLtqaflv2AnRxrkv8Sm+J0=
X-Gm-Gg: AY/fxX7BuGsypl/I8g/3rJKhYyddY52nPhDJw8YpdlAbeHJDpzR6oeYgbAk8K0nsJiC
	N+eH5CFCbo4yYOp/qO7xKOmpz9/ydf/DyNtgbun7YeIg3Mtt7wGJTAWWf+MkGY60uJ5PMdk0EXd
	OQs4OR8yiQBLfuDh/EvTooCaaq2m/fChOm2YdufIJlNPN3kv4i6pbAcdqXggmzlA4RRVukzfs0/
	cxtFXaBbOecbHZUnMDckvCZ+oeQ2X+OSW6rhcs+MoEAxNXDgp4AMRNl8iEC8L5r4HUJs+GbqKzm
	kWVMfM8xYw3cqsynYYc8LySVzZ7i
X-Google-Smtp-Source: AGHT+IEkhAN3JBU8zznfxeuU4iqR4nG6AkymGS0XQpDyuqMfnwRYOj7A11/R/1jpmMlTRsWkkib46OaiAjAonYbdyx4=
X-Received: by 2002:a05:6000:2886:b0:42f:dbbc:5103 with SMTP id
 ffacd0b85a97d-4324e4fda18mr46838205f8f.35.1767200871338; Wed, 31 Dec 2025
 09:07:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231012558.1699758-1-ihor.solodrai@linux.dev>
In-Reply-To: <20251231012558.1699758-1-ihor.solodrai@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 31 Dec 2025 09:07:40 -0800
X-Gm-Features: AQt7F2rgOTewqDmcAzVEygDD_JCldDLnUICazgBgTeXp9vlBwTr9MFsimdJvJoQ
Message-ID: <CAADnVQ+biTSDaNtoL=ct9XtBJiXYMUqGYLqu604C3D8N+8YH9A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] resolve_btfids: Implement --patch_btfids
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	bpf <bpf@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 5:26=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> Recent changes in BTF generation [1] rely on ${OBJCOPY} command to
> update .BTF_ids section data in target ELF files.
>
> This exposed a bug in llvm-objcopy --update-section code path, that
> may lead to corruption of a target ELF file. Specifically, because of
> the bug st_shndx of some symbols may be (incorrectly) set to 0xffff
> (SHN_XINDEX) [2][3].
>
> While there is a pending fix for LLVM, it'll take some time before it
> lands (likely in 22.x). And the kernel build must keep working with
> older LLVM toolchains in the foreseeable future.
>
> Using GNU objcopy for .BTF_ids update would work, but it would require
> changes to LLVM-based build process, likely breaking existing build
> environments as discussed in [2].
>
> To work around llvm-objcopy bug, implement --patch_btfids code path in
> resolve_btfids as a drop-in replacement for:
>
>     ${OBJCOPY} --update-section .BTF_ids=3D${btf_ids} ${elf}
>
> Which works specifically for .BTF_ids section:
>
>     ${RESOLVE_BTFIDS} --patch_btfids ${btf_ids} ${elf}
>
> This feature in resolve_btfids can be removed at some point in the
> future, when llvm-objcopy with a relevant bugfix becomes common.
>
> [1] https://lore.kernel.org/bpf/20251219181321.1283664-1-ihor.solodrai@li=
nux.dev/
> [2] https://lore.kernel.org/bpf/20251224005752.201911-1-ihor.solodrai@lin=
ux.dev/
> [3] https://github.com/llvm/llvm-project/issues/168060#issuecomment-35335=
52952
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
>
> ---
>
> Successful BPF CI run: https://github.com/kernel-patches/bpf/actions/runs=
/20608321584
> ---
>  scripts/gen-btf.sh                   |   2 +-
>  scripts/link-vmlinux.sh              |   2 +-
>  tools/bpf/resolve_btfids/main.c      | 117 +++++++++++++++++++++++++++
>  tools/testing/selftests/bpf/Makefile |   2 +-
>  4 files changed, 120 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/gen-btf.sh b/scripts/gen-btf.sh
> index 12244dbe097c..0aec86615416 100755
> --- a/scripts/gen-btf.sh
> +++ b/scripts/gen-btf.sh
> @@ -123,7 +123,7 @@ embed_btf_data()
>         fi
>         local btf_ids=3D"${ELF_FILE}.BTF_ids"
>         if [ -f "${btf_ids}" ]; then
> -               ${OBJCOPY} --update-section .BTF_ids=3D${btf_ids} ${ELF_F=
ILE}
> +               ${RESOLVE_BTFIDS} --patch_btfids ${btf_ids} ${ELF_FILE}
>         fi
>  }
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index e2207e612ac3..1915adf3249b 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -266,7 +266,7 @@ vmlinux_link "${VMLINUX}"
>
>  if is_enabled CONFIG_DEBUG_INFO_BTF; then
>         info OBJCOPY ${btfids_vmlinux}
> -       ${OBJCOPY} --update-section .BTF_ids=3D${btfids_vmlinux} ${VMLINU=
X}
> +       ${RESOLVE_BTFIDS} --patch_btfids ${btfids_vmlinux} ${VMLINUX}
>  fi

Applied, but please follow up to reduce the verbosity
  OBJCOPY net/mptcp/mptcp_diag.ko.BTF
  OBJCOPY net/bridge/br_netfilter.ko.BTF
  OBJCOPY net/bridge/netfilter/ebt_log.ko.BTF
  OBJCOPY net/caif/caif.ko.BTF
  OBJCOPY net/bridge/netfilter/ebt_ip.ko.BTF
  BTFIDS  net/netfilter/ipvs/ip_vs.ko
  OBJCOPY net/netfilter/ipvs/ip_vs.ko.BTF
  BTFIDS  drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko
  OBJCOPY drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko.BTF


All of these OBJCOPY lines are not correct anymore and can
be simply removed. No need to yell at the user about these steps.

imo BTFIDS lines can be removed too. They just scroll on the screen.

