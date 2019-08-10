Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4AE188A36
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 11:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbfHJJL7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 05:11:59 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:30967 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfHJJL6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 05:11:58 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x7A9BlMf000506
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Aug 2019 18:11:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x7A9BlMf000506
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565428308;
        bh=nrBKD+Eiou5+8YLKhf/aem+YiNflnyS08Pki1cL2t9U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ugXDW1XZv1rOH9ayOK9gucxnrU3EacB7FSb5EiGStvfM7lQkYlSot4VsMQxmJKCYs
         cIkrdX17cQYBFAQtTJMKLgAYruhGrXsY5Sv1Dv47P90xCgvt6MlZuSJmvoOTDAnbkH
         vIXwE/vyXzyeAj5XfY5ySQWP+XyGSqobbVyC0/Va1u8sUmyeHWywLgxdt3mx0jzvk6
         0eSGpaEZi8lEyt7kIGbNGgi6HBevOnkAsOWYhc21qvi1TtTT8SjOnsISj70ihowYmU
         dbC2n/9Z6j3jMFKco+NYuYhttXqPFl/YfF8kLiVTyYG07n76Ntka8jw3UJilVRui+E
         CIVuJcWpaQTkA==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id a186so10007131vsd.7
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Aug 2019 02:11:47 -0700 (PDT)
X-Gm-Message-State: APjAAAUAd19rQWbo7S9yazWuonetwQW9M0dxAnN9SisjGuCW80yEM+g8
        oWzS54DJAOBot36cuu39thjDLImHx79TWt1eKAM=
X-Google-Smtp-Source: APXvYqxzz/6Ya5ee4X1kXNHrVp+ZurGjJDIMMSBYN/bID4VNxpbxyrTv61w0QqyoPRgFZOMCS/+visLhnB6DdhairZI=
X-Received: by 2002:a05:6102:20c3:: with SMTP id i3mr6949355vsr.155.1565428306538;
 Sat, 10 Aug 2019 02:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190808222705.35973-1-broonie@kernel.org>
In-Reply-To: <20190808222705.35973-1-broonie@kernel.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 10 Aug 2019 18:11:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNARkfLY94D=B_h_s7Cz_DAmMUYvoYq4-xB1bt-RRJZP77Q@mail.gmail.com>
Message-ID: <CAK7LNARkfLY94D=B_h_s7Cz_DAmMUYvoYq4-xB1bt-RRJZP77Q@mail.gmail.com>
Subject: Re: [PATCH] merge_config.sh: Check error codes from make
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Guillaume Tucker <guillaume.tucker@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 9, 2019 at 7:27 AM Mark Brown <broonie@kernel.org> wrote:
>
> When we execute make after merging the configurations we ignore any
> errors it produces causing whatever is running merge_config.sh to be
> unaware of any failures.  This issue was noticed by Guillaume Tucker
> while looking at problems with testing of clang only builds in KernelCI
> which caused Kbuild to be unable to find a working host compiler.
>
> Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

I am not a big fan of this way of fixing.



[1] 'set -e' is useful to catch any error in this script.

[2] I think trapping only EXIT is smarter.
    The clean() help will be invoked when this script exits
    for whatever reason; the temporary files will be cleaned up
    when the script is interrupted, errors-out, or finishes
    successfully.


I would change like follows:


diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index d924c51d28b7..bec246719aea 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -13,12 +13,12 @@
 #  Copyright (c) 2009-2010 Wind River Systems, Inc.
 #  Copyright 2011 Linaro

+set -e
+
 clean_up() {
        rm -f $TMP_FILE
        rm -f $MERGE_FILE
-       exit
 }
-trap clean_up HUP INT TERM

 usage() {
        echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
@@ -110,6 +110,9 @@ TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
 MERGE_FILE=$(mktemp ./.merge_tmp.config.XXXXXXXXXX)

 echo "Using $INITFILE as base"
+
+trap clean_up EXIT
+
 cat $INITFILE > $TMP_FILE

 # Merge files, printing warnings on overridden values
@@ -155,7 +158,6 @@ if [ "$RUNMAKE" = "false" ]; then
        echo "#"
        echo "# merged configuration written to $KCONFIG_CONFIG (needs make)"
        echo "#"
-       clean_up
        exit
 fi

@@ -185,5 +187,3 @@ for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e
"$SED_CONFIG_EXP2" $TMP_FILE); do
                echo ""
        fi
 done
-
-clean_up





--
Best Regards
Masahiro Yamada
