Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 480DB2C63A
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2019 14:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfE1MMM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 28 May 2019 08:12:12 -0400
Received: from verein.lst.de ([213.95.11.211]:47148 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726620AbfE1MMM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 May 2019 08:12:12 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 09FED227A81; Tue, 28 May 2019 14:11:49 +0200 (CEST)
Date:   Tue, 28 May 2019 14:11:48 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     linux-kbuild@vger.kernel.org
Subject: building individual files in subdirectories
Message-ID: <20190528121148.GA18162@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

A few kernel modules have source files in multiple subdirectories.
Trying to build just a single object of a source file in such a
subdirectory currently doesn't work.

For example:

hch@brick:~/work/xfs$ make fs/xfs/libxfs/xfs_alloc.o
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  DESCEND  objtool
scripts/Makefile.build:42: fs/xfs/libxfs/Makefile: No such file or directory
make[1]: *** No rule to make target 'fs/xfs/libxfs/Makefile'.  Stop.
make: *** [Makefile:1747: fs/xfs/libxfs/xfs_alloc.o] Error 2

Is there any reasonably easy way to get this to work?
