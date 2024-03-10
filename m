Return-Path: <linux-kbuild+bounces-1199-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3BB8776DE
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Mar 2024 13:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A57C1C20DCB
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Mar 2024 12:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E79D29411;
	Sun, 10 Mar 2024 12:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVMavDlf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450A919479;
	Sun, 10 Mar 2024 12:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710075273; cv=none; b=MWXYepyqJcRGIK1LhZ+tBr2TKQwh346/udMxYvrCYpkF5mq32U76hvfm6bjIpBSLYbyk3yPpnT7BVxWoLCA1hk9EnjEnIgacGFBQICPXCEu3/nJcCq3gFsJH9aDE2dbt94wSitetmlEctOvYlooGR+e+btmTiEbywbuGN0jg6Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710075273; c=relaxed/simple;
	bh=VpKLCwYi8ECcz/PjTPwyhblCBIuecHsOQGNCRoTlXCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aj1m7bSrzxqlhtdOMYZtecQLRfg+eBdVKSHRPQJilWaibbvEX8QhwLQyIogWnBT94x58U19kIPTjpWu8rZxQr5m2QgWvnlu1x7CM1WWlhRde//LkIKat5tWVl+VGh/jEWQVuyC40vZX7t38PQ5+WfgvJrsOBKfXdya5eopLJJog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVMavDlf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E0EC43394;
	Sun, 10 Mar 2024 12:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710075272;
	bh=VpKLCwYi8ECcz/PjTPwyhblCBIuecHsOQGNCRoTlXCA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IVMavDlf0WLAAB58uHJ7OV0N2RHlSsmzGX61bR6GcAfB8Og7XcviYj8Qg7tKDixNP
	 8Q1Pwy2xgEEaWnLt3/6IDTTmmDCOCTnobmNj6V8oPgKUhGFFMuRi0AYsnMVTCPgjkE
	 oLjij/vjCMNkNXKLyImvsRtZIGbjoVbQhXSqyvXyQTvDkNXj6YO92i2ndfiSumUO1O
	 pZSx17oSekX652GUmdy1JFexjd4ouPEekLOoqPphUz950+1/gugScFRaCFVxnCEChE
	 QIs0txUwr9mL0egGbuOed9knnNmReH91GBWYKHswhNuWYcc+/eXwpYXKpuoO6cEhzT
	 4J81o8DGQj0BA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5131bec457eso2700493e87.0;
        Sun, 10 Mar 2024 05:54:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfoIdXPnJPJakOSxtl3c6iyGO7wzJ3tBxqmQMG6ZIhGle2ZsqeWmhmCY9t8MR0YCNKFBSLNuZg9ZTqQI4eqyN0SgXQ5X2u95PsA4VdjWwTK7gTTRWX25BMK0k5SVa3N4vTRiIg
X-Gm-Message-State: AOJu0Yx6otwVFdoQHLnzbD/db0g1dSucxxvijkrY9t5va9swA+UkdbuU
	DJ0CnJDS/TSm7W1jDg02Dt7+HZYInDvdq6Q+Tjz1U5F+bi9dClqaSNENAW1jQQUvig9xVESKn3D
	lXq+aMnuadtYRRrTEfvEK8HHVol4=
X-Google-Smtp-Source: AGHT+IE3mdTMa/DFw9WedI569OsVd//PftXjaGjzyjgzPj5PLZ3CM7RD3glXQ6TAZjzIdzVfPVGYpK+lflnVOXU746U=
X-Received: by 2002:a05:6512:328c:b0:513:38ad:66bc with SMTP id
 p12-20020a056512328c00b0051338ad66bcmr1767370lfe.23.1710075271266; Sun, 10
 Mar 2024 05:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305-disable-extra-clang-enum-warnings-v2-1-ba529ec15f95@kernel.org>
In-Reply-To: <20240305-disable-extra-clang-enum-warnings-v2-1-ba529ec15f95@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 10 Mar 2024 21:53:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNATPqxYub0eRXhedTpB-oAn_9Egbe+nXzGa=4RRpxq3bpw@mail.gmail.com>
Message-ID: <CAK7LNATPqxYub0eRXhedTpB-oAn_9Egbe+nXzGa=4RRpxq3bpw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Move -Wenum-{compare-conditional,enum-conversion}
 into W=1
To: Nathan Chancellor <nathan@kernel.org>
Cc: nicolas@fjasle.eu, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, arnd@arndb.de, yonghong.song@linux.dev, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 7:12=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Clang enables -Wenum-enum-conversion and -Wenum-compare-conditional
> under -Wenum-conversion. A recent change in Clang strengthened these
> warnings and they appear frequently in common builds, primarily due to
> several instances in common headers but there are quite a few drivers
> that have individual instances as well.
>
>   include/linux/vmstat.h:508:43: warning: arithmetic between different en=
umeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-e=
num-conversion]
>     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>     509 |                            item];
>         |                            ~~~~
>
>   drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c:955:24: warning: cond=
itional expression between different enumeration types ('enum iwl_mac_beaco=
n_flags' and 'enum iwl_mac_beacon_flags_v1') [-Wenum-compare-conditional]
>     955 |                 flags |=3D is_new_rate ? IWL_MAC_BEACON_CCK
>         |                                      ^ ~~~~~~~~~~~~~~~~~~
>     956 |                           : IWL_MAC_BEACON_CCK_V1;
>         |                             ~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c:1120:21: warning: con=
ditional expression between different enumeration types ('enum iwl_mac_beac=
on_flags' and 'enum iwl_mac_beacon_flags_v1') [-Wenum-compare-conditional]
>    1120 |                                                0) > 10 ?
>         |                                                        ^
>    1121 |                         IWL_MAC_BEACON_FILS :
>         |                         ~~~~~~~~~~~~~~~~~~~
>    1122 |                         IWL_MAC_BEACON_FILS_V1;
>         |                         ~~~~~~~~~~~~~~~~~~~~~~
>
> Doing arithmetic between or returning two different types of enums could
> be a bug, so each of the instance of the warning needs to be evaluated.
> Unfortunately, as mentioned above, there are many instances of this
> warning in many different configurations, which can break the build when
> CONFIG_WERROR is enabled.
>
> To avoid introducing new instances of the warnings while cleaning up the
> disruption for the majority of users, disable these warnings for the
> default build while leaving them on for W=3D1 builds.
>
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2002
> Link: https://github.com/llvm/llvm-project/commit/8c2ae42b3e1c6aa7c18f873=
edcebff7c0b45a37e
> Acked-by: Yonghong Song <yonghong.song@linux.dev>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Only disable the warning for the default build, leave it on for W=3D1 (=
Arnd)
> - Add Yonghong's ack, as the warning is still disabled for the default
>   build.
> - Link to v1: https://lore.kernel.org/r/20240305-disable-extra-clang-enum=
-warnings-v1-1-6a93ef3d35ff@kernel.org


Applied to linux-kbuild.
Thanks.




--=20
Best Regards
Masahiro Yamada

