Return-Path: <linux-kbuild+bounces-3431-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5337296F70F
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 16:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9BBF1F24997
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 14:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC041D0DD6;
	Fri,  6 Sep 2024 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7cl6zvY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F232156880;
	Fri,  6 Sep 2024 14:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725633599; cv=none; b=XgQOpy5dqZ5S/+ppwt0ynN0dy5hWMKCnnrYzmFoV5x+CemuRPJoyTEb6QnX+YtX9MberwZMPTYC6Bbxe2g1siHwbe1D6uEFTfLvE4Gs5V28p4udXIxRhASyNgSPJc9Rty5kvZEbhW2a9H6QswnhJZwIQhOl7bQBJ9wM9S0KO5Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725633599; c=relaxed/simple;
	bh=rkekp7kqM0gCAalrU8ea199BED7ngZhFWZ9ZDGtHx3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tqkrb2oRhk299QLIcN0C+sk+6TBbU6Qlx2DBGOUJr7URtHT0eQFAxstVbdkSuKRM2EiLQYAExM2rJj0EeGdWyiwPiwfkqWGU1d+9hp/r+yjUgcq1YnGjKn4/wZkAZrUeacCqtoSCnz6V2I+UraY6arBQk9m7izfcsy2A3cQi4l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7cl6zvY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D26C4CEDA;
	Fri,  6 Sep 2024 14:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725633596;
	bh=rkekp7kqM0gCAalrU8ea199BED7ngZhFWZ9ZDGtHx3k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I7cl6zvYFJlUme26uJsip2QA6i0I+jgUU8x1ZBpuFST7iADtX6k0Y5N3HgonMY7N7
	 6X7bCN3MU33QFTXdj5bjsEiDxoUIb1rbIz9WGvfiqjxFpe9Kl39vZFECdx/Uz2vD2B
	 u5VTZWBu32j/gMhZvIDzDGNYQYzX5vI6vkta+HWWaTMF+98VNhaYIwqp06PqNEQOo1
	 jv3EiVBU1vU3WZyl6atkTXR+tq9C8vpyhGXkPnjnqWVXySMfkJI1bSfwskMZYmUzGC
	 Jzoj4DaWHtefTTcpdDUIeJr1JKVqkj77cgAxHoygdqw8uF1ihuAeHovIp0BQNS9xHO
	 62WX0rTj2ctDQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f7528f4658so8436701fa.3;
        Fri, 06 Sep 2024 07:39:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlrXCeAauAasHPvwpVZJ/oe/pLOpBWJWQCjUGYuLNS5KBpJAkJhTIQmVN080HKwdOo/aap/nObCIC1WsfV@vger.kernel.org, AJvYcCVA/2N8EB9t6BZdaM9tLLJsWV2NNVq4fHSUmXYM+0DMtS7KYHOF+xS6KARZ28BBOcPwkEhZk2ZISQ==@vger.kernel.org, AJvYcCW5cfYUm5Lz+hsMmvLLtgK2GP/3aNSqzrlvh+iIAsolEGuDLYBexTynell3lageGYx4zw6bsbcEDw29WgWV@vger.kernel.org, AJvYcCWn07Dco3J4uTkJYnpi1wEvMWyLBmjc0ogMierwmSTyn+6j5XvxDaEt9CzaD8zdBtxf3WIF7D0A55NY9Lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIcgFixUqEjROnbRKTZZ+L2x3PcVprL0xNSsD8y+wreP1l41DY
	hRAeF4i1GJw9D9rX2QM+2/QSz8J6J0ohW2ygFKxQ4N67ijDJAc6DhrRtq1b26+ytDbz1/RgLem5
	3BrGtSpvZwiFhEXKUMRJSSKelctU=
X-Google-Smtp-Source: AGHT+IGL4aTm6msajUBLkGuh4MV69E6msRZnTsKTajf+VgcUyXlt6LjNklxij0DqQwf4v9zWQkEvfMasw6vxEqRUj9Q=
X-Received: by 2002:a05:6512:39ce:b0:536:54df:bff2 with SMTP id
 2adb3069b0e04-53658812f84mr1931952e87.54.1725633595218; Fri, 06 Sep 2024
 07:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com> <20240906-macos-build-support-v2-3-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-3-06beff418848@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Sep 2024 23:39:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDxVGOa5g3f_dqZ5nD_u8_a++T+ussL+AWuOXs-XOsow@mail.gmail.com>
Message-ID: <CAK7LNAQDxVGOa5g3f_dqZ5nD_u8_a++T+ussL+AWuOXs-XOsow@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] drm/xe: xe_gen_wa_oob: fix program_invocation_short_name
 for macos
To: da.gomez@samsung.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Daniel Gomez <da.gomez@samsung.com>
>
> Use getprogname() [1] instead of program_invocation_short_name() [2]
> for macOS hosts.
>
> [1]:
> https://www.gnu.org/software/gnulib/manual/html_node/
> program_005finvocation_005fshort_005fname.html
>
> [2]:
> https://developer.apple.com/library/archive/documentation/System/
> Conceptual/ManPages_iPhoneOS/man3/getprogname.3.html
>
> Fixes build error for macOS hosts:
>
> drivers/gpu/drm/xe/xe_gen_wa_oob.c:34:3: error: use of
> undeclared identifier 'program_invocation_short_name'    34 |
> program_invocation_short_name);       |                 ^ 1 error
> generated.
>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gen_wa_oob.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_g=
en_wa_oob.c
> index 904cf47925aa..0d933644d8a0 100644
> --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> @@ -8,6 +8,7 @@
>  #include <errno.h>
>  #include <stdbool.h>
>  #include <stdio.h>
> +#include <stdlib.h>
>  #include <string.h>
>
>  #define HEADER \
> @@ -30,6 +31,9 @@
>
>  static void print_usage(FILE *f)
>  {
> +#ifdef __APPLE__
> +       const char *program_invocation_short_name =3D getprogname();
> +#endif
>         fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file>=
 <generated-c-header-file>\n",
>                 program_invocation_short_name);
>  }
>
> --
> 2.46.0
>
>



Before adding such #ifdef, you should check how other programs do.









Solution 1 : hard-code the program name


diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index 106ee2b027f0..9e9a29e2cecf 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -30,8 +30,7 @@

 static void print_usage(FILE *f)
 {
-       fprintf(f, "usage: %s <input-rule-file>
<generated-c-source-file> <generated-c-header-file>\n",
-               program_invocation_short_name);
+       fprintf(f, "usage: xe_gen_wa_oob <input-rule-file>
<generated-c-source-file> <generated-c-header-file>\n");
 }

 static void print_parse_error(const char *err_msg, const char *line,








Solution 2: use argv[0]


diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index 106ee2b027f0..600c63e88e46 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -28,10 +28,10 @@
        "\n" \
        "#endif\n"

-static void print_usage(FILE *f)
+static void print_usage(FILE *f, const char *progname)
 {
        fprintf(f, "usage: %s <input-rule-file>
<generated-c-source-file> <generated-c-header-file>\n",
-               program_invocation_short_name);
+               progname);
 }

 static void print_parse_error(const char *err_msg, const char *line,
@@ -136,7 +136,7 @@ int main(int argc, const char *argv[])

        if (argc < 3) {
                fprintf(stderr, "ERROR: wrong arguments\n");
-               print_usage(stderr);
+               print_usage(stderr, argv[0]);
                return 1;
        }








--=20
Best Regards
Masahiro Yamada

