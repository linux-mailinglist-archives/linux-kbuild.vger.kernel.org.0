Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8873C7C937F
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Oct 2023 10:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbjJNIgg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 14 Oct 2023 04:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232960AbjJNIgf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Oct 2023 04:36:35 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55BF9DC
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Oct 2023 01:36:32 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F37FC433C7
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Oct 2023 08:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697272591;
        bh=aHL/WqlFErNGXGiwapJdKxSDSd48GX2HEHqlCazr7rQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CpYZoOjnRXP1yrBXijNsvKirhfFG2mvI03A2PxTBMpbuNPWGQEWnBD0bq/1bHL8I+
         coQfTiqgb5VBL+J8vLuCu5wzQsnJiQK5CmNR95+iXwzdpLXWo4oFIa7n4zoLNyh8Qe
         s/tj61qE8WMp9tqLmU9JzMOI89Dt6KUfDBnC/nIwEltsL15Yxb/eq6q9Xe6Eg6jhZd
         6F//ZYz3Ifjw04Na+CCHrGmm1PWKJ+vNXvpwaqiQmG/NZ3fGX7dCPeQBD2ADNjn9V2
         gY8g9Woj76RjADqV2ADYgfOPO56VGkuB6D1YQ9PFCJCWkH5JzIHJuc3MVtsqC6WK71
         9HrxWVnqgie7w==
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6c64c2c0f97so1766147a34.3
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Oct 2023 01:36:31 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz5ntxj7aYbH0NV86qx7atfve5lhq5WzrU+1R5JkWvLbU8qYuhV
        QN63p+6m+55wHq8ZiIc4ZeToCWh3vzBQ9Y+ANyc=
X-Google-Smtp-Source: AGHT+IGbj1ld9sr8d4lmDlrEwBi8vGTv25EDR8SaK89TmW48PEgSXIc43jnAshj7uUlBvrx5LPN0efOnhREzZwNkGBs=
X-Received: by 2002:a05:6870:ce48:b0:1e9:858e:ff23 with SMTP id
 xd8-20020a056870ce4800b001e9858eff23mr10123367oab.55.1697272590864; Sat, 14
 Oct 2023 01:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <lp2gjgzwxvhluh7fpmmo2drhii7bxcrlvxacclfgsl4ycubjhc@jjq2jfvow4y2>
In-Reply-To: <lp2gjgzwxvhluh7fpmmo2drhii7bxcrlvxacclfgsl4ycubjhc@jjq2jfvow4y2>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 14 Oct 2023 17:35:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNATLv2KSWo0BnFGXi73GVdnvc1EX23TvTkKT1U-krgBnNQ@mail.gmail.com>
Message-ID: <CAK7LNATLv2KSWo0BnFGXi73GVdnvc1EX23TvTkKT1U-krgBnNQ@mail.gmail.com>
Subject: Re: # Toplevel Makefile doesn't process module build correctly on
 recursive make calls
To:     Marcos Paulo de Souza <mpdesouza@suse.de>
Cc:     linux-kbuild@vger.kernel.org, mbenes@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 10, 2023 at 5:43=E2=80=AFAM Marcos Paulo de Souza <mpdesouza@su=
se.de> wrote:
>
> Hi all,
>
> I found an issue while moving the livepatch kselftest modules to be built=
 on the
> fly, instead of building them on kernel building.
>
> If, for some reason, there is a recursive make invocation that starts fro=
m the
> top level Makefile and in the leaf Makefile it tries to build a module (u=
sing M=3D
> in the make invocation), it doesn't produce the module. This happens beca=
use the
> toplevel Makefile checks for M=3D only once. This is controlled by the
> sub_make_done variable, which is exported after checking the command line
> options are passed to the top level Makefile. Once this variable is set i=
t's
> the M=3D setting is never checked again on the recursive call.
>
> This can be observed when cleaning the bpf kselftest dir. When calling
>
>         $ make TARGETS=3D"bpf" SKIP_TARGETS=3D"" kselftest-clean
>
> What happens:
>
>         1. It checks for some command line settings (like M=3D) was passe=
d (it wasn't),
>         set some definitions and exports sub_make_done.
>
>         2. Jump into tools/testing/selftests/bpf, and calls the clean tar=
get.
>
>         3. The clean target is overwritten to remove some files and then =
jump to
>         bpf_testmod dir and call clean there
>
>         4. On bpf_testmod/Makefile, the clean target will execute
>                 $(Q)make -C $(KDIR) M=3D$(BPF_TESTMOD_DIR) clean
>
>         5. The KDIR is to toplevel dir. The top Makefile will check that =
sub_make_done was
>         already set, ignoring the M=3D setting.
>
>         6. As M=3D wasn't checked, KBUILD_EXTMOD isn't set, and the clean=
 target applies
>         to the kernel as a whole, making it clean all generated code/obje=
cts and
>         everything.
>
> One way to avoid it is to call "unexport sub_make_done" on
> tools/testing/selftests/bpf/bpf_testmod/Makefile before processing the al=
l
> target, forcing the toplevel Makefile to process the M=3D, producing the =
module
> file correctly.
>
> If the M=3Ddir points to /lib/modules/.../build, then it fails with "m2c:=
 No such
> file", which I already reported here[1]. At the time this problem was tre=
ated
> like a problem with kselftest infrastructure.
>
> Important: The process works fine if the initial make invocation is targe=
ted to a
> different directory (using -C), since it doesn't goes through the topleve=
l
> Makefile, and sub_make_done variable is not set.
>
> I attached a minimal reproducer, that can be used to better understand th=
e
> problem. The "make testmod" and "make testmod-clean" have the same effect=
 that
> can be seem with the bpf kselftests. There is a unexport call commented o=
n
> test-mods/Makefile, and once that is called the process works as expected=
.
>
> Is there a better way to fix this? Is this really a problem, or am I miss=
ing
> something?


Or, using KBUILD_EXTMOD will work too.





--
Best Regards
Masahiro Yamada
