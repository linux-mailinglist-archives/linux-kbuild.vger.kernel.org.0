Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20D66E6E95
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Apr 2023 23:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbjDRVsa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Apr 2023 17:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbjDRVsY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Apr 2023 17:48:24 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D66D125B0
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Apr 2023 14:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681854493; x=1713390493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5rT5kR396dabn0yHosHD4RtOCD5NH8f7Hqp0D0aupPY=;
  b=W68GQHxS6xa2ESE08WKCLqsfyHvmVfXExJrNQUuvq1ZFQ8usnQPJn02+
   /sr52hp++ysbNNb1HFJ76m1CUq+te9HL0o9hMSloAHnR5n1KTENmbARts
   +aXtqfFDSzUmQPMYefjlg3QNuZcIgkMjqHf1XPAWBnCRrZTz+iVNLrrUG
   X5oEPzLHTAYdkDWfN1eIsFBQEKeKQchCAbSsXxj653sCZczbSNhixjHl/
   p/jGNu8h9wQXp2Vec6omZWqDm7JJjArD6lkJm4m8g6Simd8pmrw4na2+l
   SAaVivuezp7OE8+GQAX2KMd10GFgZUj57+UXpwevAeul9/XuCvWLBCA97
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="344045194"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="344045194"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 14:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="802681526"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="802681526"
Received: from vkrish2-mobl1.amr.corp.intel.com (HELO kdpelton-desk) ([10.212.111.84])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 14:48:08 -0700
Date:   Tue, 18 Apr 2023 14:48:06 -0700
From:   Kyle Pelton <kyle.d.pelton@linux.intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Subject: make rpm-pkg broken after f8d94c4e403c kbuild: do not create
 intermediate...
Message-ID: <ZD8Py7WsKLK3umvX@kdpelton-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

I am getting the below rpm-pkg build failure after this patch was
introduced in v6.2-rc7:
f8d94c4e403c kbuild: do not create intermediate *.tar for source tarballs

If I revert the patch, the failure is gone.

Thanks,
Kyle

f8d94c4e403c kbuild: do not create intermediate *.tar for source tarballs

[root@efd6e5b39c41 linux]# RPMOPTS="--nodeps" make rpm-pkg
sh ./scripts/package/mkspec >./kernel.spec
rpmbuild --nodeps --target x86_64-linux -bs kernel.spec \
--define='_smp_mflags %{nil}' --define='_sourcedir rpmbuild/SOURCES' --define='_srcrpmdir .'
Building target platforms: x86_64-linux
Building for target x86_64-linux
Wrote: ./kernel-6.3.0_rc7_00043_gaf67688dca57-1.src.rpm
rpmbuild --nodeps --target x86_64-linux -rb kernel-6.3.0_rc7_00043_gaf67688dca57-1.src.rpm \
--define='_smp_mflags %{nil}'
Installing kernel-6.3.0_rc7_00043_gaf67688dca57-1.src.rpm
Building target platforms: x86_64-linux
Building for target x86_64-linux
Executing(%prep): /bin/sh -e /var/tmp/rpm-tmp.Pa04vf
+ umask 022
+ cd /root/rpmbuild/BUILD
+ cd /root/rpmbuild/BUILD
+ rm -rf linux
+ /usr/bin/gzip -dc /root/rpmbuild/SOURCES/linux.tar.gz
+ /usr/bin/tar -xof -
+ STATUS=0
+ '[' 0 -ne 0 ']'
+ cd linux
/var/tmp/rpm-tmp.Pa04vf: line 40: cd: linux: No such file or directory
error: Bad exit status from /var/tmp/rpm-tmp.Pa04vf (%prep)


RPM build errors:
    Bad exit status from /var/tmp/rpm-tmp.Pa04vf (%prep)
make[1]: *** [scripts/Makefile.package:69: rpm-pkg] Error 1
make: *** [Makefile:1656: rpm-pkg] Error 2
