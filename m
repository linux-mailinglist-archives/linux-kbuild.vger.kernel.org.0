Return-Path: <linux-kbuild+bounces-1942-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E548D1C7C
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 15:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0805D1C224D2
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 13:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4750C17084D;
	Tue, 28 May 2024 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctErwS+7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175F217083F;
	Tue, 28 May 2024 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716902133; cv=none; b=GTJunO+vuQPJW8oVYjf37n8YkQz1boLL1IC8U80GshnJtM65Np8FTsaZhcT1QN3dyD1SRecxJwIPV8XhiFso86wM2oj+Tv8PX2DgNZ6UUk8D1rla7Lg+OAnjskw0c5rUCCJ43tD9SbBm9pD6hOPg+j2P0ryiJkGlQ/hQT8+H6IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716902133; c=relaxed/simple;
	bh=/76kI/YtfSwDPNJdygfTQuFGxhnsOBunca2XNFzS+rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3QgN53jcjuzoCJ85wJI+vhFvXi7g68x+6efD/U0z6giPSCEQuzKb2PrMTdSuW9nwlPVkz9WYG2pZigCYTUvbQrD9tHVheQ4GyQv2nday810427RG81bNDt965/xysKnmeYte7r4p/x4DkTv/H5yEf1im6HogzDy0tpuHOfgG5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctErwS+7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE332C3277B;
	Tue, 28 May 2024 13:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716902133;
	bh=/76kI/YtfSwDPNJdygfTQuFGxhnsOBunca2XNFzS+rA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ctErwS+7vb+NQtV5ceHFhXO6y+FdWqcJbMhlTLRMVvQvn208zL3wf2zEdx2zHL3TS
	 sL6GuYiYQ7tu5K151JaVz5cHgWo0ru2hLCUEd1GF4SoASVi3K63sd9MSP06GRxd1X6
	 cFCHpI7cLiefVNkXY/p3rHlOBc1UZCVciX6M/LwkDyptt0KWdeVu5sn71ZclYfIg9C
	 mPSue3i+fWnbKo9X72x/PT4GZLVKKAR9/cyUsklA2OFaytHrLt+rb9MroQHjvMKT0/
	 wug9NWm+eZ8Ip62lTgDnc8Z4mP1j7jPLZ9TjCEY5UlLjsu4N9mZxlE1ucsOMEDx6pP
	 hhbySe0HPKMYw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-529661f2552so1051448e87.2;
        Tue, 28 May 2024 06:15:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXErJ/X9/+KTMhzKIrk+Tw1PboL3BCEKYF/L9hNHXoT5lN322E2iB5NXMhlrNHdr/iNTL2tTyl7s12wDZi2RpfT84C0DfBdUq3fLAMUG4bXF9CtUHM0E1IARr/f5CzG9/U2wIr8egA4uK79d6zlkoqXFMG6zT4uEm6XsmdqDDrR/l3vn46/BA==
X-Gm-Message-State: AOJu0Yy2Wdt09t8UsmHIhuyb2rRd9kDkzLRwQ/1y6uPQqiBPXyHxxwIq
	wng2Q0jnxcna9+8Mg4hcyRuBYtBvz9q4nKyEURYO1vuRykHAwIh++HFuf5fDUm+KyZyqAS9rRBO
	EsFSlja27NucpmYsAl6MXSaM07g==
X-Google-Smtp-Source: AGHT+IFiFyyv72cCPAF/vzlRq990HrHo8s4Hbv30EFAay8D1Osh075iZehiv/shf76u8DvWSNFRxNboCOVyeNgDdcuc=
X-Received: by 2002:a2e:808e:0:b0:2d3:f095:ff2a with SMTP id
 38308e7fff4ca-2e95b2e3912mr74238501fa.47.1716902131312; Tue, 28 May 2024
 06:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-dtbo-check-schema-v1-1-ee1094f88f74@linaro.org>
In-Reply-To: <20240527-dtbo-check-schema-v1-1-ee1094f88f74@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 May 2024 08:15:17 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+cmNmm4we6B6OdeS_Qty44FxKmtZHDjLBi9f=DaBw4GA@mail.gmail.com>
Message-ID: <CAL_Jsq+cmNmm4we6B6OdeS_Qty44FxKmtZHDjLBi9f=DaBw4GA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: verify dtoverlay files against schema
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 6:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Currently only the single part device trees are validated against DT
> schema. For the multipart schema files only the first file is validated.

What do you mean by multipart schema files? Did you mean multipart DTs
(i.e. base plus overlays)?

Looks good otherwise and I can fix that up.

> Extend the fdtoverlay commands to validate the resulting DTB file
> against schema.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  scripts/Makefile.lib | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 9f06f6aaf7fc..29da0dc9776d 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -407,8 +407,15 @@ cmd_dtc =3D $(HOSTCC) -E $(dtc_cpp_flags) -x assembl=
er-with-cpp -o $(dtc-tmp) $< ;
>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>
> +DT_CHECK_CMD =3D $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BI=
NDING_DIR) -p $(DT_TMP_SCHEMA)
> +
> +ifneq ($(CHECK_DTBS),)
> +quiet_cmd_fdtoverlay =3D DTOVLCH $@
> +      cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(re=
al-prereqs) ; $(DT_CHECK_CMD) $@ || true
> +else
>  quiet_cmd_fdtoverlay =3D DTOVL   $@
>        cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(re=
al-prereqs)
> +endif
>
>  $(multi-dtb-y): FORCE
>         $(call if_changed,fdtoverlay)
> @@ -421,7 +428,7 @@ DT_BINDING_DIR :=3D Documentation/devicetree/bindings
>  DT_TMP_SCHEMA :=3D $(objtree)/$(DT_BINDING_DIR)/processed-schema.json
>
>  quiet_cmd_dtb =3D        DTC_CHK $@
> -      cmd_dtb =3D        $(cmd_dtc) ; $(DT_CHECKER) $(DT_CHECKER_FLAGS) =
-u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true
> +      cmd_dtb =3D        $(cmd_dtc) ; $(DT_CHECK_CMD) $@ || true
>  else
>  quiet_cmd_dtb =3D $(quiet_cmd_dtc)
>        cmd_dtb =3D $(cmd_dtc)
>
> ---
> base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
> change-id: 20240527-dtbo-check-schema-4f695cb98de5
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>

