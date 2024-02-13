Return-Path: <linux-kbuild+bounces-922-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06423854071
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Feb 2024 00:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB7CBB23425
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Feb 2024 23:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30B7633F9;
	Tue, 13 Feb 2024 23:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WxlZD6g7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237EE633E8
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Feb 2024 23:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707868598; cv=none; b=cBT781gBHFOx1zXIXyuFhQBTgujrEZNfxGih9xlEhDqMaZ8fYK7udQwh52cVgg6qwNO6HMOrXOTMkgpBBkJWFZp9NJB84eIJq6/IUkg015RT1lcGcbMVlomSEvqN6hoMTm7jarCTMQnc0+HXRjvq0XIE4Nk5RkPKc1UnUi5KX94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707868598; c=relaxed/simple;
	bh=eG1Z7qXp1jDGBo50wsnYjDQwhUF5D2ifiNDV1RQ+kpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4GP+yKOX1PxGyCQv9wU5dSRLtelOzhsj8WycurlQX79oyNbGo7i2n79ZkX0PigYsli4TZXEHHaBH0b9ye/z8BChRACmFq2qM8GPyCzGdwfc3TNZ3r7jixWV03216svxZFsvtyVFQ045abNrSglK9mlJLoQMlH/Nx9dgXUVaxdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WxlZD6g7; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3641ec7803fso3216545ab.2
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Feb 2024 15:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707868596; x=1708473396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j5i0+7qUkGUR+StQ2aGirnK2+rjtRkZXXH7K9o3+5lE=;
        b=WxlZD6g7OdQLjuRfBGPOhxKRIg8AqBXP4EHhI5tcB2vs2JGR9Q9UX7v7HF/VpJfW6I
         sqgDWwRo9ccvV/iREbDb69y5Hu9nuYHikBdvxM3hfuhiyMOzdGAvSiKEKTecv3So6Vdj
         3YEoBy36bNfQYLe2omuzplTiE3I30r8zuhfIr/0glJkUM9vLpZZTvji5OkBmtWm+zwDm
         R7/zvmzb3ZuB+wSckTdkPUgs+zABNzWPRze1vhPkdw80qjx67JVSqf5ZYQECt9ggWisW
         OMkibnCWnQFa2pSCWQi35FTv9tLt+SkCYThCEDsCW/Vj+n1SAYpl0wYdd/v+FBUhNhgY
         7Vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707868596; x=1708473396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5i0+7qUkGUR+StQ2aGirnK2+rjtRkZXXH7K9o3+5lE=;
        b=TqcWkfMkJc5YW56LzPrOXA0krqzVMoJ4Cb5LgEGG88ipean3kEMwg4ksXsRWdqnD1y
         Z1V4z4JEss1vwe8AGmMipWndAegg1zAY65evxJHq9NoY5gFka8ZNy6P3myUznwAeLY5m
         ABbWrZ0F9a4STxKrYNd9+IxVHD/991CNPoT3WTKpI8Wg0NDWS9Hz4O+ZI5VQaFwwReaO
         ZlxTYkt9yLr6+JyEpJeCeb159pgwV+PTBjQ4bdLOHrhq0A19xVlpx8QPkNTz1+GrrjFt
         uY/qz2ZjRXWN9AErWAF8kcjKywKD8UKVT8QUcth+DZwjSKQkTDzCuwFZXNwQ6/ZF667d
         zm9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVU/2MKTN9oj+ewnIwAp09FyEKFpNkTNALVUJTZCV1LQby5lcbNjUcNxB7XfYZ7hi4z0NCWF8F/7C+57VvQKi4qcEhsH88zZpqpxxM
X-Gm-Message-State: AOJu0YzjIE9Kw+ZYaiiL6OzvqD2XXLVzaib4CXVKjqje5pM74v/KbAyA
	58DdHmS0ufjlDL62fQlRO9awJsutSkF+rTccik25lEuXdZJAHxav5a8g6jL4MA==
X-Google-Smtp-Source: AGHT+IG62RuLwq2OLE5Yz0FmcAHGNtv9/YBtgvIUbfni/ZF6on/cLe36ocrjEhGbaxm7Edp0+sjhbg==
X-Received: by 2002:a05:6e02:1bc7:b0:363:cbb8:53c7 with SMTP id x7-20020a056e021bc700b00363cbb853c7mr1787567ilv.23.1707868596087;
        Tue, 13 Feb 2024 15:56:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXYvP9l0sxOZNWxefz67TKAm7Fu6CaEpFHauX0AQItVIogkJSLzPJZFx0UakEwLZxl00t5oU+31mhKid7inxkeFp2reqoNF7I1kQxXuMe0ZLLjU+VNcyvi5h0kzhX+TyeJ1VP43aVOT4m3qsJuZ2WTnAEwLcwMnWktU04ycyXRDgCmsBODEflPdYmaHZucstimY66Km2/Z5gIAEwJ1hCoRUXhk25LYKDboLX3KT8nLXdpopsd/2CwWbSm4unOobRINWMcfmsvORIfDXc7r/Zsi25RKx+qHoRGHeVwQ1Bb6ybiJKW3ABwCmcS53hIVlmX6p+Il8fLHtHn7VLINZCCIx57OjUssEr+x0lmRVkHqzYzjQ=
Received: from google.com (20.10.132.34.bc.googleusercontent.com. [34.132.10.20])
        by smtp.gmail.com with ESMTPSA id n11-20020a02cc0b000000b004739f0fc27fsm2028449jap.164.2024.02.13.15.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 15:56:35 -0800 (PST)
Date: Tue, 13 Feb 2024 23:56:30 +0000
From: Justin Stitt <justinstitt@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, ndesaulniers@google.com,
	morbo@google.com, keescook@chromium.org, maskray@google.com,
	linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Fix changing ELF file type for output of
 gen_btf for big endian
Message-ID: <20240213235630.423raijsgijkgrnj@google.com>
References: <20240212-fix-elf-type-btf-vmlinux-bin-o-big-endian-v2-1-22c0a6352069@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212-fix-elf-type-btf-vmlinux-bin-o-big-endian-v2-1-22c0a6352069@kernel.org>

Hi,

On Mon, Feb 12, 2024 at 07:05:10PM -0700, Nathan Chancellor wrote:
> Commit 90ceddcb4950 ("bpf: Support llvm-objcopy for vmlinux BTF")
> changed the ELF type of .btf.vmlinux.bin.o to ET_REL via dd, which works
> fine for little endian platforms:
>
>    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
>   -00000010  03 00 b7 00 01 00 00 00  00 00 00 80 00 80 ff ff  |................|
>   +00000010  01 00 b7 00 01 00 00 00  00 00 00 80 00 80 ff ff  |................|
>
> However, for big endian platforms, it changes the wrong byte, resulting
> in an invalid ELF file type, which ld.lld rejects:
>
>    00000000  7f 45 4c 46 02 02 01 00  00 00 00 00 00 00 00 00  |.ELF............|
>   -00000010  00 03 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |................|
>   +00000010  01 03 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |................|
>
>   Type:                              <unknown>: 103
>
>   ld.lld: error: .btf.vmlinux.bin.o: unknown file type
>
> Fix this by updating the entire 16-bit e_type field rather than just a
> single byte, so that everything works correctly for all platforms and
> linkers.
>
>    00000000  7f 45 4c 46 02 02 01 00  00 00 00 00 00 00 00 00  |.ELF............|
>   -00000010  00 03 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |................|
>   +00000010  00 01 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |................|
>
>   Type:                              REL (Relocatable file)
>
> While in the area, update the comment to mention that binutils 2.35+
> matches LLD's behavior of rejecting an ET_EXEC input, which occurred
> after the comment was added.
>
> Cc: stable@vger.kernel.org
> Fixes: 90ceddcb4950 ("bpf: Support llvm-objcopy for vmlinux BTF")
> Link: https://github.com/llvm/llvm-project/pull/75643
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

I prefer this version to v1 as well. This seems better than setting the
seek value.

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
> Changes in v2:
> - Rather than change the seek value for dd, update the entire e_type
>   field (Masahiro). Due to this change, I did not carry forward the
>   tags of v1.
> - Slightly update commit message to remove mention of ET_EXEC, which
>   does not match the dump (Masahiro).
> - Update comment to mention binutils 2.35+ has the same behavior as LLD
>   (Fangrui).
> - Link to v1: https://lore.kernel.org/r/20240208-fix-elf-type-btf-vmlinux-bin-o-big-endian-v1-1-cb3112491edc@kernel.org
> ---
>  scripts/link-vmlinux.sh | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index a432b171be82..7862a8101747 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -135,8 +135,13 @@ gen_btf()
>  	${OBJCOPY} --only-section=.BTF --set-section-flags .BTF=alloc,readonly \
>  		--strip-all ${1} ${2} 2>/dev/null
>  	# Change e_type to ET_REL so that it can be used to link final vmlinux.
> -	# Unlike GNU ld, lld does not allow an ET_EXEC input.
> -	printf '\1' | dd of=${2} conv=notrunc bs=1 seek=16 status=none
> +	# GNU ld 2.35+ and lld do not allow an ET_EXEC input.
> +	if is_enabled CONFIG_CPU_BIG_ENDIAN; then
> +		et_rel='\0\1'
> +	else
> +		et_rel='\1\0'
> +	fi
> +	printf "${et_rel}" | dd of=${2} conv=notrunc bs=1 seek=16 status=none
>  }
>
>  # Create ${2} .S file with all symbols from the ${1} object file
>
> ---
> base-commit: 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478
> change-id: 20240208-fix-elf-type-btf-vmlinux-bin-o-big-endian-dbc55a1e1296
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
Thanks
Justin

