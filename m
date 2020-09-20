Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F0427187E
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Sep 2020 00:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgITWs0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 20 Sep 2020 18:48:26 -0400
Received: from 2.152.178.181.dyn.user.ono.com ([2.152.178.181]:36164 "EHLO
        pulsar.hadrons.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgITWsZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Sep 2020 18:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hadrons.org
        ; s=201908; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:From:Reply-To:Subject:Content-Type:Content-ID:Content-Description:
        In-Reply-To:References:X-Debbugs-Cc;
        bh=BEaf5N67gW/3JDSsMKeXlNJnbEC057EVIzScGuD+00g=; b=vystEKXyxgDyK9obe+gyKrVsEh
        3/73jE9dMfR3PJRKFK82s7YaSfp5zunvX4dy8JEaMksgAv6Husg9wA82xFczjkW8SNfGIpiQ6L8Lo
        IrZfFHk47NJAeUct6xJHpYTgljG87GKnZaBcFO50kJ75MaUgb8goCApEr+xC1gt7h2OsVxj4/sgrp
        /NJ+iHMvl8mmJZnTuhtPUB2oqvE9NlS4YmnJ01zOyYzH7o6boB+PE/4SP8koF8DeXkLxeLZmXHOQz
        kC/E9O0zaDe687tfGk162dFfoLD4iFttnc860XeLCpj/Yo4rbSdBWAahhzDvuZxVmoTPkXbOVGPnG
        HKLm6P6A==;
Received: from guillem by pulsar.hadrons.org with local (Exim 4.92)
        (envelope-from <guillem@hadrons.org>)
        id 1kK7my-0002c7-NK; Mon, 21 Sep 2020 00:26:32 +0200
From:   Guillem Jover <guillem@hadrons.org>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] builddeb: Improve Debian packaging
Date:   Mon, 21 Sep 2020 00:25:49 +0200
Message-Id: <20200920222556.10002-1-guillem@hadrons.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi!

This series fixes some packaging issues and brings it closer to
current standards.

Thanks,
Guillem

Guillem Jover (7):
  builddeb: Pass -n to gzip for reproducible packages
  builddeb: Move upstream repository URL into the upstream metadata file
  builddeb: Switch to a machine readable copyright file
  builddeb: Add support for all required debian/rules targets
  builddeb: Enable rootless builds
  builddeb: Map rc versions to use an earlier than version scheme
  builddeb: Try to get the user full name from the GECOS field

 scripts/package/builddeb | 11 ++++++--
 scripts/package/mkdebian | 59 +++++++++++++++++++++++++++-------------
 2 files changed, 48 insertions(+), 22 deletions(-)

-- 
2.28.0.297.g1956fa8f8d

