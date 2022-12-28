Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB5665760A
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Dec 2022 12:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbiL1LvR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Dec 2022 06:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233005AbiL1LvO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Dec 2022 06:51:14 -0500
X-Greylist: delayed 366 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 28 Dec 2022 03:51:10 PST
Received: from out-50.mta0.migadu.com (out-50.mta0.migadu.com [IPv6:2001:41d0:1004:224b::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 116022DFB
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Dec 2022 03:51:09 -0800 (PST)
Message-ID: <ee227d24-9c94-bfa3-166a-4ee6b5dfea09@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1672227901;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=hQ3HRHsAyvXz9e4bfw9E+D1d8Pl2zTCcmjB1WnAKvRM=;
        b=xGFjtPPPYkQfGB3O2Jpmhb+e0rwa/qFQZDpQL5imWFWElr1hP1DSv4jlcjWyxYm/doeoUW
        Y/o/Q8HhtjhSptODXhl2Mu0vWC6rfZq7rxANg+kX0SPJdfvcZi5IJqKsV3oAxEzv0Mxxxz
        NoyLbp/Iq6zQP7cEJI5ZoY84qlkf2I0=
Date:   Wed, 28 Dec 2022 19:44:56 +0800
MIME-Version: 1.0
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Guoqing Jiang <guoqing.jiang@linux.dev>
To:     ivecera@redhat.com
Cc:     masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
        nicolas@fjasle.eu, linux-kbuild@vger.kernel.org
Subject: Can't compile v6.2-rc1 kernel rpm in openSUSE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

With latest v6.2-rc1, I can't compile kernel rpm in openSUSE leap.

linux> make rpm-pkg -j16
  SYNC    include/config/auto.conf.cmd
  HOSTCC  scripts/kconfig/conf.o
  HOSTLD  scripts/kconfig/conf
  UPD     include/config/kernel.release
make clean
sh ./scripts/package/mkspec >./kernel.spec
  TAR     kernel-6.2.0_rc1_150400.24.38_default+.tar.gz
rpmbuild  --target x86_64-linux -ta 
kernel-6.2.0_rc1_150400.24.38_default+.tar.gz \
--define='_smp_mflags %{nil}'
Building target platforms: x86_64-linux
Building for target x86_64-linux
error: Failed build dependencies:
        elfutils-libelf-devel is needed by 
kernel-6.2.0_rc1_150400.24.38_default+-8.x86_64
make[1]: *** [scripts/Makefile.package:62: rpm-pkg] Error 1
make: *** [Makefile:1652: rpm-pkg] Error 2


Seems the below change in commit 8818039f959b("kbuild: add ability
to make source rpm buildable using koji") caused the issue.

@@ -49,6 +51,9 @@sed -e '/^DEL/d' -e 's/^\t*//' <<EOF
        URL: https://www.kernel.org
$S     Source: kernel-$__KERNELRELEASE.tar.gz
        Provides: $PROVIDES
+$S     BuildRequires: bc binutils bison dwarves elfutils-libelf-devel flex
+$S     BuildRequires: gcc make openssl openssl-devel perl python3 rsync

Because the relevant package name in openSUSE is libelf-devel as
mentioned in ./tools/perf/Makefile.config

Please install libelf-dev, libelf-devel or elfutils-libelf-devel


Thanks,
Guoqing
