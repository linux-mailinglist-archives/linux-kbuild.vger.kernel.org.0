Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36BF0781CCC
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Aug 2023 09:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjHTHfk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 20 Aug 2023 03:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjHTHfi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Aug 2023 03:35:38 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06A34204
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Aug 2023 00:33:37 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bdbbede5d4so18035115ad.2
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Aug 2023 00:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692516817; x=1693121617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JT3lS/Jv4Funx3x4lB2IfaEWNFY6X105VqzhdeEsq94=;
        b=VyUcsj1JGYEopaoBHIqTW+KTajNecFXm1mCLu66FxbfJp/r0p5D6QzZO7ZIAeYX4oa
         UunNQ36jLS2a7vGTXUDPhPAXtt7Tszi6R5NAResk8U1xJJbs/iRfxVX4g2A8whEWqPOO
         eC1EwXjuH9a6pEZnZcLNX046Z8q0eW1Kg2vmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692516817; x=1693121617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JT3lS/Jv4Funx3x4lB2IfaEWNFY6X105VqzhdeEsq94=;
        b=RzZTEd/as8x1N4e1TiTN/yxPNwq7RCK92Av1o9s2gBA8D8BFfZfxCs2bWiR3U7MVNR
         YEau9SiQc8whD47SYPy/s1E/RKDtiyhQAS64AoSjbeGLjFQj7k0ObWj6JEplJvFJU/a5
         jzhcBjwO35sbbOM9RRFwxfQzw/0JeBcDP7MgyvxK57M1v1a3Y1xKtFG/fFFA5ajcX5m1
         XWRARZk+WjrhEVNEVNaNIatO8u+caw0fOEMpZQGumm2Hmvivv0MzjWplrLHyYCI4E3G5
         K9smTnP/oaICN2kOjToz8JIsISfcmLzPKYdCGZ2Jglb9Lsu4gCOa/6xEwArsOOLITO0p
         aZFw==
X-Gm-Message-State: AOJu0YwFf+YGQjq7mBCQI3DWQp4zRhGew20m/IepsFTmWUWDdnO2CCGd
        gjDWXX/IZJOJnOQHz3Sn7t00NuUUipX0PPnjjOc=
X-Google-Smtp-Source: AGHT+IEje6KjE5NQg/EB2Mr/qhSz7z0A+zpIPsBpEjnxEEcS++pnUt3/LqKj+wpt3NNsuCMvqnKtqA==
X-Received: by 2002:a17:903:1108:b0:1bc:1b01:8961 with SMTP id n8-20020a170903110800b001bc1b018961mr4803262plh.1.1692516817118;
        Sun, 20 Aug 2023 00:33:37 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id z17-20020a170903019100b001bf846dd2ebsm108808plg.303.2023.08.20.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 00:33:36 -0700 (PDT)
Date:   Sun, 20 Aug 2023 16:33:32 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] kconfig: introduce listunknownconfig
Message-ID: <20230820073332.GN907732@google.com>
References: <20230817012007.131868-1-senozhatsky@chromium.org>
 <CAK7LNASJWKSsdzn5ccgWaC35-XvHGU7pnE6C=eZFDbqrrghtdQ@mail.gmail.com>
 <20230820024519.GK907732@google.com>
 <CAK7LNAS9KC1GjPgadMEivSpy4TMYU8mQ+BrtfJpNs2kvhK18yA@mail.gmail.com>
 <20230820072119.GM907732@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820072119.GM907732@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On (23/08/20 16:21), Sergey Senozhatsky wrote:
> What the preferred approach would be? Do we want a new KCONFIG_FOO env
> variable that changes behaviour of one of the targets? E.g.
> 
> 	KCONFIG_LIST_MISSING=1 make oldconfig
> 
> and then have conf list symbols and terminate with exit(1) if there are
> some unrecognized symbols?


Will something like this be OK with you?


 KCONFIG_LIST_MISSING=1 make oldconfig

.config:6:warning: unknown symbol: DISABLE_BUGS
.config:7:warning: unknown unset symbol: ENABLE_WINAPI

make[2]: *** [scripts/kconfig/Makefile:77: oldconfig] Error 1


---

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index fa2ae6f63352..b2c0bcf0e5c1 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -360,7 +360,9 @@ int conf_read_simple(const char *name, int def)
        char *p, *p2;
        struct symbol *sym;
        int i, def_flags;
+       const char *list_missing;
 
+       list_missing = getenv("KCONFIG_LIST_MISSING");
        if (name) {
                in = zconf_fopen(name);
        } else {
@@ -448,6 +450,12 @@ int conf_read_simple(const char *name, int def)
                        if (def == S_DEF_USER) {
                                sym = sym_find(line + 2 + strlen(CONFIG_));
                                if (!sym) {
+                                       if (list_missing) {
+                                               conf_warning("unknown unset symbol: %s",
+                                                            line + 2 + strlen(CONFIG_));
+                                               continue;
+                                       }
+
                                        conf_set_changed(true);
                                        continue;
                                }
@@ -482,6 +490,12 @@ int conf_read_simple(const char *name, int def)
 
                        sym = sym_find(line + strlen(CONFIG_));
                        if (!sym) {
+                               if (list_missing) {
+                                       conf_warning("unknown symbol: %s",
+                                                    line + strlen(CONFIG_));
+                                       continue;
+                               }
+
                                if (def == S_DEF_AUTO)
                                        /*
                                         * Reading from include/config/auto.conf
@@ -530,6 +544,13 @@ int conf_read_simple(const char *name, int def)
        }
        free(line);
        fclose(in);
+
+       if (list_missing) {
+               if (conf_warnings)
+                       exit(1);
+               exit(0);
+       }
+
        return 0;
 }
